//
//  ContentView.swift
//  github_search_app
//
//  Created by 後閑諒一 on 2021/08/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {        
        Text("Hello")
    }
}


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
                .frame(width: 60, height: 60)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                .shadow(color: .gray, radius: 1, x: 0, y: 0)
            
            Text(input.title)
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
            
            HStack {
                Text(input.language ?? "")
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
            Text(input.description ?? "")
                .foregroundColor(.black)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
        }
        .padding(24)
        .frame(minWidth: 140, minHeight: 180)
        .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
        .clipped()
        .background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(input: .init(iconImage: UIImage(named: "rocket")!,
                                  title: "SwiftUI",
                                  language: "Swift",
                                  star: 100,
                                  description: "memomomomomoomomomo",
                                  url: "https:example.com"))
            .previewLayout(.sizeThatFits)
    }
}
