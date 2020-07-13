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
                }
            }
            .navigationBarTitle("\(self.mission.displayName)", displayMode: .inline)
        }
    }
    
    init(_ mission: Mission) {
        self.mission = mission
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("mission")
    
    static var previews: some View {
        MissionView(missions[0])
    }
}
