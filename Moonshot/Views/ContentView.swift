//
//  ContentView.swift
//  Moonshot
//
//  Created by Nate Lee on 7/13/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    let missions: [Mission] = Bundle.main.decode("missions")
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts")
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission, self.astronauts)) {
                    HStack {
                        Image(mission.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                        
                        VStack(alignment: .leading) {
                            Text("\(mission.displayName)")
                                .font(Font.body.weight(.bold))
                            
                            Text("\(mission.formattedDateString)")
                        }
                    }
                    
                }
            }
            .navigationBarTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
