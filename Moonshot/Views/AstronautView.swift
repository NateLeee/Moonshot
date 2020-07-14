//
//  AstronautView.swift
//  Moonshot
//
//  Created by Nate Lee on 7/14/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts")
    let astronaut: Astronaut
    let missions: [Mission]
    
    var body: some View {
        GeometryReader { geometryProxy in
            ScrollView(.vertical) {
                VStack(spacing: 27) {
                    ZStack(alignment: .bottomTrailing) {
                        Image(self.astronaut.id)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometryProxy.size.width)
                        
                        Text(self.astronaut.name)
                            .underline()
                            .font(Font.custom("Courier New", size: 21))
                            .foregroundColor(.white)
                            .padding(.bottom, 9)
                            .padding(.trailing, 9)
                            .shadow(color: .black, radius: 6)
                    }
                    
                    Text(self.astronaut.description)
                        .font(Font.custom("Hoefler Text", size: 16))
                        .lineSpacing(3)
                        .padding(.horizontal)
                        .layoutPriority(1) // Kinda important!
                    
                    // For better layout.
                    ZStack(alignment: .leading) {
                        Divider()
                            .padding(.horizontal)
                        
                        Text("📋")
                            .font(.system(size: 45))
                            .padding(.horizontal, 27)
                    }
                    
                    HStack {
                        Text("Involved Mission\(self.missions.count > 1 ? "s" : "")")
                            .font(Font.custom("Courier New", size: 20).weight(.bold))
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    // Challenge II: - Show all the missions this astronaut flew on.
                    ForEach(self.missions) { mission in
                        NavigationLink(destination: MissionView(mission, self.astronauts)) {
                            HStack {
                                Image(mission.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 72)
                                
                                VStack(alignment: .leading, spacing: 9) {
                                    Text("\(mission.displayName)")
                                        .font(Font.custom("Courier New", size: 15).bold())
                                        .underline()
                                    
                                    Text("Launch Date: \(mission.formattedDateString)")
                                        .font(Font.custom("Courier New", size: 14))
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    Spacer(minLength: 45)
                }
            }
        }
    }
    
    init(_ astronaut: Astronaut) {
        self.astronaut = astronaut
        self.missions = AstronautView.getMissions(by: astronaut.id)
    }
    
    static func getMissions(by astronautId: String) -> [Mission] {
        let allMissions: [Mission] = Bundle.main.decode("missions")
        
        let pickedMissions = allMissions.map { (mission) -> Mission? in
            let crews = mission.crew
            
            let a = crews.first { (crew) -> Bool in
                crew.name == astronautId
            }
            
            return a != nil ? mission : nil
        }.compactMap { mission in mission }
        
        return pickedMissions
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts")
    
    static var previews: some View {
        AstronautView(astronauts[0])
    }
}
