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
                
                // 처음 랜덤으로 단어를 생성할 때
                // 몇개의 단어를 생성할지 Picker로 선언한 부분
                // Picker를 따로 View로 빼둠
                PickerView(numOfWords: $numOfWords)
                
                Text("Pick number of words to show")
                    .padding()
                
                // Go 를 누르면 하위 View로 이동
                // 현재 생성된 단어를 확인할 수 있는 View
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
