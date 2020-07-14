//
//  AstronautView.swift
//  Moonshot
//
//  Created by Nate Lee on 7/14/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        GeometryReader { geometryProxy in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                    
                    Text(self.astronaut.name)
                    
                    Text(self.astronaut.description)
                }
            }
        }
    }
    
    init(_ astronaut: Astronaut) {
        self.astronaut = astronaut
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts")
    
    static var previews: some View {
        AstronautView(astronauts[0])
    }
}
