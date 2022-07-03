//
//  WordHistoryView.swift
//  WordQuiz_re
//
//  Created by 이성민 on 2022/07/02.
//

import SwiftUI

struct WordHistoryView: View {
    
    @EnvironmentObject var wordsVM: WordsViewModel
    @State var presentAlert: Bool = false
    @State var wordInput: String = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(wordsVM.history, id:\.self) { word in
                    Button("\(word)"){
                        presentAlert = true
                    }
                    .sheet(isPresented: $presentAlert) {
                        VStack {
                            Text("Input the word to change to")
                            TextField("\(word)", text: $wordInput)
                                .multilineTextAlignment(.center)
                            
                            HStack {
                                Button(action: {
                                    wordsVM.changeWord(word, to: wordInput)
                                    wordInput = ""
                                    presentAlert = false
                                }) {
                                    Text("Change")
                                }
                                .padding()
                                
                                Button("Cancel", role: .cancel, action:{
                                    presentAlert = false
                                })
                                .padding()
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Word History")
        }
        
    }
}

struct WordHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        WordHistoryView()
    }
}
