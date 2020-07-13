//
//  Astronaut.swift
//  Moonshot
//
//  Created by Nate Lee on 7/13/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    var id: String // 'cause here is an id field, protocal Identifiable is allowed!
    var name: String
    var description: String
}

