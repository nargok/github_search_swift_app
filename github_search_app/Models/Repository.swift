//
//  Repository.swift
//  github_search_app
//
//  Created by 後閑諒一 on 2021/08/15.
//

import Foundation

struct Repository: Decodable, Hashable, Identifiable {
    var id: Int64
    var name: String
    var description: String?
    var stargazersCount: Int = 0
    var language: String?
    var url: String
    var owner: Owner
}
