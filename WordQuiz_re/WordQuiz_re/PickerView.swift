//
//  PickerView.swift
//  WordQuiz_re
//
//  Created by 이성민 on 2022/07/01.
//

import SwiftUI

struct PickerView: View {
    
    @Binding var numOfWords: Int
    
    let limit = 1...15
    
    var body: some View {
        Picker("Number of words to show", selection: $numOfWords) {
            ForEach(limit, id: \.self) { num in
                Text("\(num)")
            }
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(numOfWords: .constant(0))
    }
}
