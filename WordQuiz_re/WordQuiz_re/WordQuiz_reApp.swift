//
//  WordQuiz_reApp.swift
//  WordQuiz_re
//
//  Created by 이성민 on 2022/07/01.
//

import SwiftUI

@main
struct WordQuiz_reApp: App {
    
    @StateObject var wordsVM = WordsViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(wordsVM)
        }
    }
}
