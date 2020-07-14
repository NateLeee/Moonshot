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
    
    
    var body: some View {
        GeometryReader { geometryProxy in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometryProxy.size.width * 0.69)
                        .padding(.top, 27)
                        .padding(.bottom, 45)
                    
                    HStack {
                        Spacer(minLength: 18)
                        
                        Text(self.mission.description)
                        
                        Spacer(minLength: 18)
                    }
                    
                    Spacer(minLength: 27)
                    
                    ForEach(self.crewMembers, id: \.role) { crewMember in
                        Button(action: {
                            //
                            print("Haha")
                        }) {
                            HStack {
                                ZStack(alignment: .topLeading) {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 108, height: 69)
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
                                        .font(.caption)
                                        .foregroundColor(crewMember.role == "Commander" ? .primary : .secondary)
                                        .underline(crewMember.role == "Commander", color: .blue)
                                    
                                    Text("\(crewMember.astronaut.name)")
                                        .font(Font.custom("Avenir Next", size: 18).weight(.light))
                                    
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
