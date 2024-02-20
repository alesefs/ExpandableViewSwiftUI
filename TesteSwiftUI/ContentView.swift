//
//  ContentView.swift
//  TesteSwiftUI
//
//  Created by Alessandro Emanuel Ferreira De Souza on 24/01/24.
//

import SwiftUI

struct ContentView: View {
   
    var itemsArray = Data().items
    
    init() {
        UINavigationBar.appearance().barTintColor = #colorLiteral(
            red: 0.74, green: 0.13, blue: 0.30, alpha: 1
        )
        
        UINavigationBar.appearance().titleTextAttributes =
        [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().isTranslucent = false
        
        UIScrollView.appearance().backgroundColor = UIColor(
            Color(#colorLiteral(
                red: 0.62, green: 0.11, blue: 0.25, alpha: 1
            ))
        )
    }
    
    var body: some View { //setContent{}
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0..<itemsArray.count, id: \.self) { row in
                        //row (tipo index) ->
                        ListCell(
                            row: row,
                            question: itemsArray[row].question,
                            answer: itemsArray[row].answer
                        )
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Exapandable List Swift UI Example")
        }
    }
    
}

#Preview {
    ContentView()
}
