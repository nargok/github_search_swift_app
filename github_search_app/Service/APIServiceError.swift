//
//  APIServiceError.swift
//  github_search_app
//
//  Created by 後閑諒一 on 2021/08/15.
//

import Foundation

enum APIServiceError: Error {
    case invalidURL
    case responseError
    case parseError(Error)
}
