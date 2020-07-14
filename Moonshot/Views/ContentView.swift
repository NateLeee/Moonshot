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
                                .font(Font.custom("Courier New", size: 16).weight(.bold))
                                .padding(.bottom, 6)
                            
                            Text("\(mission.formattedDateString)")
                                .font(Font.custom("Hoefler Text", size: 13).weight(.light))
                        }
                        .padding(.horizontal, 9)
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
