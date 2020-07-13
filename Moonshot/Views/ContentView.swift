//
//  ContentView.swift
//  Moonshot
//
//  Created by Nate Lee on 7/13/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var astronauts = [Astronaut]()
    
    var body: some View {
        List(astronauts) { astronaut in
            Text("\(astronaut.name)")
        }
        .onAppear(perform: decodeData)
    }
    
    private func decodeData() {
        self.astronauts = Bundle.main.decode("astronauts")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
