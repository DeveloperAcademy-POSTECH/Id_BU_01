//
//  WordView.swift
//  WordQuiz
//
//  Created by 이성민 on 2022/06/04.
//

import SwiftUI

struct WordView: View {
    @StateObject var viewModel = ViewModel()
    @Binding var number: Int
    
    let limit = 1...15
    
    
    let columns = [
        GridItem(), GridItem(), GridItem()
    ]
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: columns){
                ForEach(viewModel.words, id: \.self){ word in
                    Text(word)
                        .font(.system(size:15))
                        .padding(.bottom, 30)
                }
            }
            
            VStack {
                Spacer()
                Picker("Number of Words to Show", selection: $number) {
                    ForEach(limit, id: \.self){ num in
                        Text("\(num)")
                    }
                }
            }
            .pickerStyle(.wheel)
        }
        .onAppear{
            viewModel.fetchNumber(number)
        }
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(viewModel: ViewModel(), number: .constant(13))
    }
}
