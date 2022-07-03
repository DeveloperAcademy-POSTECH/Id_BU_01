//
//  NewView.swift
//  WordQuiz_re
//
//  Created by 이성민 on 2022/07/01.
//

import SwiftUI

struct NewView: View {
    
    @EnvironmentObject var wordsVM: WordsViewModel
    
    // 몇개의 단어를 새로 생성할지 지정하는 Binding
    @Binding var numOfWords: Int
    
    // 한번에 생성할 수 있는 단어 개수 제한
    let limit = 1...15
    let columns = [
        GridItem(), GridItem(), GridItem()
    ]
    
    var body: some View {
        VStack {
            
            // 단어들을 LazyVGrid로 생성
            LazyVGrid(columns: columns) {
                ForEach(wordsVM.words, id: \.self) { word in
                    Text(word)
                        .font(.system(size:15))
                        .padding(.bottom, 30)
                }
            }
            
            Spacer()
            
            VStack {
                
                // 다시 랜덤 단어 생성할 때 몇개의 단어 생성할지 고르는 Picker
                // 이전에 생성한 View를 사용하지 않은 이유는
                // 솔직히 헷갈려서...
                Picker("Number of words to show", selection: $numOfWords) {
                    ForEach(limit, id: \.self) { num in
                        Text("\(num)")
                    }
                }
                
                // 버튼을 누르면 다시 랜덤한 단어 생성
                Button(action: {
                    wordsVM.fetchWords(numOfWords)
                }) {
                    Text("Randomize Again")
                }
            }
            .padding()
        }
        .task {
            
            // 해당 View가 생성되었을 때 fetch도 함께 할 수 있도록
            // .task 안에 fetch 해오는 코드 실행
            wordsVM.fetchWords(numOfWords)
        }
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView(numOfWords: .constant(0))
    }
}
