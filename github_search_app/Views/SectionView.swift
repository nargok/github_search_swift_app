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
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Swift")
                .font(.title)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(input.repogitories) { repository in
                        CardView(input: .init(iconImage: UIImage(named: "rocket")!, title: "swiftui", language: "swift", star: 46, description: "memo"))
                            .contentShape(Rectangle())
                            .sheet(isPresented: self.$isActive, content: {
                                Text("ddd")
                            })
                            .onTapGesture {
                                self.isActive = true
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
