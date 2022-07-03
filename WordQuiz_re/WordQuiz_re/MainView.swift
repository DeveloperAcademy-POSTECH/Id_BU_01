//
//  MainView.swift
//  WordQuiz_re
//
//  Created by 이성민 on 2022/07/02.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var wordsVM = WordsViewModel()
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Random Words", systemImage: "character")
                }
                .environmentObject(wordsVM)
            
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
