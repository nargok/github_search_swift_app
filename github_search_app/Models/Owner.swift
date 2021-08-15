//
//  Owner.swift
//  github_search_app
//
//  Created by 後閑諒一 on 2021/08/15.
//

import Foundation

struct Owner: Decodable, Hashable, Identifiable {
    var id: Int64
    var avatarUrl: String
}
