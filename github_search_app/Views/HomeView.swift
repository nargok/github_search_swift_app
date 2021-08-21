//
//  HomeView.swift
//  github_search_app
//
//  Created by 後閑諒一 on 2021/08/21.
//

import SwiftUI

struct HomeView: View {
    let repo = Repository(id: 1, name: "swift", description: "memo", stargazersCount: 21, language: "swift", url: "https://goog.com", owner: Owner(id: 1, avatarUrl: "mark"))
    
    @State private var text = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                SectionView(input: .init(repogitories: [repo, repo], searchKeyword: "swift"))
                    .padding(.bottom, 16)
                    .previewLayout(.sizeThatFits)
                
                SectionView(input: .init(repogitories: [repo, repo], searchKeyword: "swift"))
                    .previewLayout(.sizeThatFits)
                SectionView(input: .init(repogitories: [repo, repo], searchKeyword: "swift"))
                    .previewLayout(.sizeThatFits)
            }
            .padding(.all, 20)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: HStack{
                TextField("検索キーワードを入力", text: self.$text, onCommit: {
                    
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.asciiCapable)
                .frame(width: UIScreen.main.bounds.width - 40)
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
