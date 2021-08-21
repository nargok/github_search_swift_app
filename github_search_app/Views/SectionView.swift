//
//  SectionView.swift
//  github_search_app
//
//  Created by 後閑諒一 on 2021/08/21.
//

import SwiftUI

struct SectionView: View {
    struct Input {
        let repogitories: [Repository]
        let searchKeyword: String
    }
    
    let input: Input
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Swift")
                .font(.title)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    CardView(input: .init(iconImage: UIImage(named: "rocket")!, title: "swiftui", language: "swift", star: 29, description: "memo"))
                    ForEach(input.repogitories) { repository in
                        CardView(input: .init(iconImage: UIImage(systemName:  "camera")!, title: "swiftui", language: "swift", star: 46, description: "memo"))
                        
                            .onTapGesture {
                                print("ssss")
                            }
                    }
                    
                }
            }
        }
        
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(input: .init(repogitories: testRepositories, searchKeyword: "swift"))
            .previewLayout(.sizeThatFits)
    }
    
    
    private static var testRepositories: [Repository] {
        let repo = Repository(id: 1, name: "swift", description: "memo", stargazersCount: 23, language: "swift", url: "http://example.com", owner: Owner(id: 1, avatarUrl: "mark"))
        return [repo, repo, repo]
    }
}
