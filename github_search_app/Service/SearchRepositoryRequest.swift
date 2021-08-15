//
//  SearchRepositoryRequest.swift
//  github_search_app
//
//  Created by 後閑諒一 on 2021/08/15.
//

import Foundation

struct SearchRepositoryRequest: APIRequestType {
    typealias Response =  SearchRepositoryResponse
    
    var path: String { return "/search/repositories" }
    var queryItems: [URLQueryItem]? {
        return [
            .init(name: "q", value: query),
            .init(name: "order", value: "desc")
        ]
    }
    
    private let query: String
    
    init(query: String) {
        self.query = query
    }
}
