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
    let missions: [Mission] = Bundle.main.decode("missions")
    
    var body: some View {
        VStack(spacing: 18) {
            List(astronauts) { astronaut in
                Text("\(astronaut.name)")
            }
            
            List(missions) { mission in
                Text("\(mission.id)")
            }
        }
        .onAppear(perform: decodeData)
    }
    
    private func decodeData() {
        self.astronauts = Bundle.main.decode("astronauts")
//        self.missions = Bundle.main.decode("missions")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
