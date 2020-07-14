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
                VStack(spacing: 27) {
                    ZStack(alignment: .bottomTrailing) {
                        Image(self.astronaut.id)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometryProxy.size.width)
                        
                        Text(self.astronaut.name)
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
                    
                    Spacer(minLength: 45)
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
