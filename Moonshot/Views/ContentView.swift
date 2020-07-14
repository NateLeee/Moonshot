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
    
    @State private var showingCrewName = false
    
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
                            
                            if (!self.showingCrewName) {
                                Text("\(mission.formattedDateString)")
                                    .font(Font.custom("Courier New", size: 13).weight(.light))
                            } else {
                                Text("\(self.getCrewNames(mission))")
                                    .font(Font.custom("Courier New", size: 11).weight(.light))
                            }
                        }
                        .padding(.horizontal, 9)
                    }
                    
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing: Toggle(isOn: $showingCrewName) {
                EmptyView()
            })
                .animation(.default)
        }
    }
    
    private func getCrewNames(_ mission: Mission) -> String {
        let crews = mission.crew
        let ids = crews.map { $0.name }
        
        let names = astronauts.map { (astronaut) -> String? in
            var result: String?
            ids.forEach { (id) in
                if (id == astronaut.id) {
                    result = astronaut.name
                    return
                }
            }
            return result
        }.compactMap { (name) in name }
        
        return names.joined(separator: " | ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
