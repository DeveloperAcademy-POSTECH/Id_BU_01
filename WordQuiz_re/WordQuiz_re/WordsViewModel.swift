//
//  WordsViewModel.swift
//  WordQuiz_re
//
//  Created by 이성민 on 2022/07/01.
//

import Foundation

class WordsViewModel: ObservableObject {
    
    // fetch 해온 단어를 저장할 String 형 Array
    @Published var words: [String] = []
    
    // 몇개의 단어를 생성할지 지정하는 변수
    @Published var numOfWords: Int = 0
    
    // 현재까지 생성된 단어를 저장해두는 String 형 Array
    @Published var history: [String] = []
    
    // 단어를 받아올 URL은 바뀌지 않을거기 때문에 let으로 선언
    let rootURL = "https://random-word-api.herokuapp.com/word?"
    
    // 단어 가져오는 코드
    func fetchWords(_ n: Int) {
        
        // URLComponent형 변수 만드는 과정
        // -> Query 아이템 쉽게 추가할 수 있게 하기 위해
        guard var urlComp = URLComponents(string: rootURL) else { return }
        
        let urlNumberQuery = [URLQueryItem(name: "number", value: "\(n)")]
        
        urlComp.queryItems = urlNumberQuery
        
        // URLComponent형을 다시 URL형으로 바꾸는 과정
        guard let url = urlComp.url else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                let words = try decoder.decode(Array<String>.self, from: data)
                
                DispatchQueue.main.async {
                    self.words = words
                    
                    for word in words {
                        self.history.append(word)
                    }
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    // 원래 단어의 index를 찾아와서 바뀐 값으로 저장
    func changeWord(_ original: String, to changed: String) {
        let index = history.firstIndex(where: { $0 == original })
        
        history[index!] = changed
    }
    
    
}
