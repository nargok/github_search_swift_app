//
//  ContentView.swift
//  github_search_app
//
//  Created by 後閑諒一 on 2021/08/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
//        Text("Hello")
        
        CardView(input: .init(iconImage: UIImage(named: "rocket")!,
                                  title: "SwiftUI",
                                  language: "Swift",
                                  star: 100,
                                  description: "memo"))
            .previewLayout(.sizeThatFits)
    }
}


struct CardView: View {
    
    struct Input {
        let iconImage: UIImage
        let title: String
        let language: String
        let star: Int
        let description: String
    }
    
    let input: Input
    
    init(input: Input) {
        self.input = input
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Image(uiImage: input.iconImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            
            Text(input.title)
                .font(.title)
            
            HStack {
                Text(input.language)
                    .font(.footnote)
                    .foregroundColor(.gray)
                Spacer()
                
                HStack(spacing: 4) {
                    Image(systemName: "star")
                        .renderingMode(.template)
                        .foregroundColor(.gray)
                    Text(String(input.star))
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            Text(input.description)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
        }
        .padding()
        .frame(minWidth: 140, maxWidth: 280, minHeight: 180)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(input: .init(iconImage: UIImage(named: "rocket")!,
                                  title: "SwiftUI",
                                  language: "Swift",
                                  star: 100,
                                  description: "memomomomomoomomomo"))
            .previewLayout(.sizeThatFits)
    }
}
