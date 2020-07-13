//
//  ContentView.swift
//  Moonshot
//
//  Created by Nate Lee on 7/13/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { proxy in
                Image("example")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: proxy.size.width)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
