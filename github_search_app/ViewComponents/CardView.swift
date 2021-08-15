//
//  CardView.swift
//  github_search_app
//
//  Created by 後閑諒一 on 2021/08/14.
//

import SwiftUI

struct CardView: View {
    
    struct Input: Identifiable {
        let id: UUID = UUID()
        let iconImage: UIImage
        let title: String
        let language: String?
        let star: Int
        let description: String?
        let url: String
    }
    
    let input: Input
    
    init(input: Input) {
        self.input = input
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Image(uiImage: input.iconImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/.stroke(Color.gray, lineWidth: 2))
                .shadow(color: .gray, radius: 1, x: 0, y: 0)
                
            
            Text(input.title)
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(input: .init(iconImage: UIImage(named: "hoge")!, title: "SwiftUI", language: "Swift", star: 100, description: "memo", url: "https://example.com"))
    }
}
