//
//  WordHistoryView.swift
//  WordQuiz_re
//
//  Created by 이성민 on 2022/07/02.
//

import SwiftUI

struct WordHistoryView: View {
    
    @EnvironmentObject var wordsVM: WordsViewModel
    
    // 단어를 바꿀 때 모달 띄우게 하는 State 변수와
    // 모달 안에서 어떤 단어로 바꿀지 입력하는 입력값
    @State var presentAlert: Bool = false
    @State var wordInput: String = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(wordsVM.history, id:\.self) { word in
                    
                    // 모든 단어를 누르면 모달이 뜨도록 함
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
                                    
                                    // 새로 입력한 단어로
                                    // history가 바뀔 수 있도록 하는 함수
                                    wordsVM.changeWord(word, to: wordInput)
                                    
                                    // 바뀔 단어 입력하면 유지되는게 아니라
                                    // 다음에 바뀔 때를 대비하여
                                    // 그냥 빈칸으로 바꿈
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
