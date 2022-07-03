//
//  ContentView.swift
//  WordQuiz_re
//
//  Created by 이성민 on 2022/07/01.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var wordsVM: WordsViewModel
    @State var numOfWords: Int = 1
    
    var body: some View {
        NavigationView {
            VStack {
                PickerView(numOfWords: $numOfWords)
                Text("Pick number of words to show")
                    .padding()
                NavigationLink(destination: NewView(numOfWords: $numOfWords)
                    .environmentObject(wordsVM)) {
                    Text("Go")
                }
            }
            .navigationTitle("Random Words")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
