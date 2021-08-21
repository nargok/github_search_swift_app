//
//  HomeViewModel.swift
//  github_search_app
//
//  Created by 後閑諒一 on 2021/08/21.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    enum Inputs {
        case onEnetr(text: String)
        case tappedErrorAlert
    }
    
    func apply(inputs: Inputs) {
        switch inputs {
        case .onEnetr(let query):
            onEnterSubject.send(query)
        case .tappedErrorAlert:
            tappedErrorAlertSubject.send(())
        }
    }
    
    @Published private(set) var repositories: [Repository] = []
    @Published private(set) var inputText: String = ""
    @Published var isShowError = false
    @Published var isShowIndicator = false
    
    init(apiService: APIService) {
        self.apiService = apiService
        bindInputs()
        bindOutputs()
    }
    
    private let apiService: APIService
    private let onEnterSubject = PassthroughSubject<String, Never>()
    private let tappedErrorAlertSubject = PassthroughSubject<Void, Never>()
    private let responseSubject = PassthroughSubject<SearchRepositoryResponse, Never>()
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    private var cancellables:[AnyCancellable] = []
    
    private func bindInputs() {
        let responsePublisher = onEnterSubject
            .flatMap { [apiService] (query) in
                apiService.response(from: SearchRepositoryRequest(query: query))
                    .catch { [weak self] error -> Empty<SearchRepositoryResponse, Never> in
                        self?.errorSubject.send(error)
                        return .init()
                    }
            }
        
        let loadingStartPublisher = onEnterSubject
            .map { _ in true }
            .assign(to: \.isShowIndicator, on: self)
        
        let tappedErrorAlertPublisher = tappedErrorAlertSubject
            .map { _ in false }
            .assign(to: \.isShowError, on: self)
        
        let responseStream = responsePublisher
            .share()
            .subscribe(responseSubject)
        
        cancellables += [
            responseStream,
            loadingStartPublisher,
            tappedErrorAlertPublisher
        ]
    }
    
    private func bindOutputs() {
        let repositoriesStream = responseSubject
            .map { $0.items }
            .sink(receiveValue: {(repositories) in
                self.repositories = repositories
                self.inputText = ""
                self.isShowIndicator = false
            })
        
        let errorStream = errorSubject
            .map { _ in true }
            .assign(to: \.isShowError, on: self)
        
        cancellables += [
            repositoriesStream,
            errorStream
        ]
    }
}
