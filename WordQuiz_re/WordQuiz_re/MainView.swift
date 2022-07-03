//
//  MainView.swift
//  WordQuiz_re
//
//  Created by 이성민 on 2022/07/02.
//

import SwiftUI

struct MainView: View {
    
    // WordQuiz_re 에서 가져온 EnvironmentObject 선언
    @EnvironmentObject var wordsVM: WordsViewModel
    
    var body: some View {
        TabView {
            
            // 랜덤한 단어들이 생성되는 View
            ContentView()
                .tabItem {
                    Label("Random Words", systemImage: "character")
                }
                .environmentObject(wordsVM)
            
            // 지금까지 나온 단어들을 모두 보여주는 View
            WordHistoryView()
                .tabItem {
                    Label("Word History", systemImage: "list.dash")
                }
                .environmentObject(wordsVM)   
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
