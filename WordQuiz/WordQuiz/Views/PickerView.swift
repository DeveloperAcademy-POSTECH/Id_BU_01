//
//  PickerView.swift
//  WordQuiz
//
//  Created by 이성민 on 2022/06/04.
//

import SwiftUI

struct PickerView: View {
    @State var number: Int
    
    let limit = 1...15
    
    var body: some View {
        VStack {
            Picker("Number of Words to Show", selection: $number) {
                ForEach(limit, id: \.self){ num in
                    Text("\(num)")
                }
            }
            NavigationLink("Show"){
                WordView(number: $number)
            }
        }
        .pickerStyle(.wheel)
        
    }}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(number: 13)
    }
}
