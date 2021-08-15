//
//  ContentView.swift
//  github_search_app
//
//  Created by 後閑諒一 on 2021/08/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Text("hello")
    }
}


struct TempCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "camera")
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 20.0)
                    .foregroundColor(.white)
                
                Text("SSS")
                    .font(.headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
            }
            Text("BBBB")
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
        }
        .background(Color.black)
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TempCardView()
    }
}
