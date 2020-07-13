//
//  ContentView.swift
//  Moonshot
//
//  Created by Nate Lee on 7/13/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct CustomText: View {
    var text: String
    
    var body: some View {
        Text("\(text)")
    }
    
    init(_ text: String) {
        self.text = text
        print("Item \(text) init-ed!")
    }
}

struct ContentView: View {
    var body: some View {
        List {
            ForEach(0 ..< 100) {
                CustomText("Item \($0)")
                    .font(.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
