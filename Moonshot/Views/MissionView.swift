//
//  MissionView.swift
//  Moonshot
//
//  Created by Nate Lee on 7/13/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    var mission: Mission
    
    struct CrewMember {
        let astronaut: Astronaut
        let role: String
    }
    
    let crewMembers: [CrewMember]
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts")
    
    var body: some View {
        GeometryReader { geometryProxy in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometryProxy.size.width * 0.69)
                        .padding(.top, 27)
                    
                    // Challenge I: - Add the launch date to MissionView, below the mission badge.
                    if (self.mission.launchDate != nil) {
                        Text("\(self.mission.formattedDateString)")
                            .font(Font.custom("Courier New", size: 18).bold())
                            .underline(color: .secondary)
                    }
                    
                    HStack {
                        Spacer(minLength: 18)
                        
                        Text(self.mission.description)
                            .font(Font.custom("Hoefler Text", size: 16))
                            .lineSpacing(3)
                        
                        Spacer(minLength: 18)
                    }
                    .padding(.top, 36)
                    
                    Spacer(minLength: 27)
                    
                    ForEach(self.crewMembers, id: \.role) { crewMember in
                        NavigationLink(destination: AstronautView(crewMember.astronaut)) {
                            HStack {
                                ZStack(alignment: .topLeading) {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 99, height: 63)
                                        .clipShape(Capsule())
                                        .overlay(Capsule().stroke(Color.blue, lineWidth: 1))
                                        .padding(1)
                                        .overlay(Capsule().stroke(Color.red, lineWidth: 1))
                                        .padding(1)
                                        .overlay(Capsule().stroke(Color.blue, lineWidth: 1))
                                        .padding(1)
                                        .overlay(Capsule().stroke(Color.red, lineWidth: 1))
                                        .shadow(color: .gray, radius: 18)
                                    
                                    Text("📎")
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("\(crewMember.role)")
                                        .font(Font.custom("Courier New", size: 13))
                                        .foregroundColor(crewMember.role == "Commander" ? .primary : .secondary)
                                        .underline(crewMember.role == "Commander", color: .blue)
                                    
                                    Text("\(crewMember.astronaut.name)")
                                        .font(Font.custom("Courier New", size: 16).weight(.light))
                                        .padding(.top, 6)
                                    
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
            .navigationBarTitle("\(self.mission.displayName)", displayMode: .inline)
        }
    }
    
    init(_ mission: Mission, _ astronauts: [Astronaut]) {
        self.mission = mission
        self.crewMembers = mission.crew.map({ (crew) -> CrewMember in
            let astronautId = crew.name
            guard let astronaut = astronauts.first(where: { astronautId == $0.id }) else {
                fatalError("Missing \(astronautId)")
            }
            let crewMember = CrewMember(astronaut: astronaut, role: crew.role)
            return crewMember
        })
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("mission")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts")
    
    static var previews: some View {
        MissionView(missions[0], astronauts)
    }
}
