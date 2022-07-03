//
//  NewView.swift
//  WordQuiz_re
//
//  Created by 이성민 on 2022/07/01.
//

import SwiftUI

struct NewView: View {
    
    @EnvironmentObject var wordsVM: WordsViewModel
    @Binding var numOfWords: Int
    
    let limit = 1...15
    let columns = [
        GridItem(), GridItem(), GridItem()
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns) {
                ForEach(wordsVM.words, id: \.self) { word in
                    Text(word)
                        .font(.system(size:15))
                        .padding(.bottom, 30)
                }
            }
            
            Spacer()
            
            VStack {
                
                Picker("Number of words to show", selection: $numOfWords) {
                    ForEach(limit, id: \.self) { num in
                        Text("\(num)")
                    }
                }
                
                Button(action: {
                    wordsVM.fetchWords(numOfWords)
                }) {
                    Text("Randomize Again")
                }
            }
            .padding()
        }
        .task {
            wordsVM.fetchWords(numOfWords)
        }
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView(numOfWords: .constant(0))
    }
}
