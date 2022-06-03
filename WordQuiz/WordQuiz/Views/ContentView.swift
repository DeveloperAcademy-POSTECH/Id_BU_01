//
//  ContentView.swift
//  WordQuiz
//
//  Created by 이성민 on 2022/06/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("Pick Number of Words to Show")
                PickerView(number: 1)
            }
            .navigationBarTitle("Pick Number")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
