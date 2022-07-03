//
//  WordsViewModel.swift
//  WordQuiz_re
//
//  Created by 이성민 on 2022/07/01.
//

import Foundation

class WordsViewModel: ObservableObject {
    
    @Published var words: [String] = []
    @Published var numOfWords: Int = 0
    @Published var history: [String] = []
    
    let rootURL = "https://random-word-api.herokuapp.com/word?"
    
    func fetchWords(_ n: Int) {
        
        guard var urlComp = URLComponents(string: rootURL) else { return }
        
        let urlNumberQuery = [URLQueryItem(name: "number", value: "\(n)")]
        
        urlComp.queryItems = urlNumberQuery
        
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
    
    
    func changeWord(_ original: String, to changed: String) {
        let index = history.firstIndex(where: { $0 == original })
        
        history[index!] = changed
    }
    
    
}
