//
//  Mission.swift
//  Moonshot
//
//  Created by Nate Lee on 7/13/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct Crew: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [Crew]
    let description: String
    
    // MARK: - Not in JSON, other fields
    var imageName: String {
        "apollo\(id)"
    }
    
    var displayName: String {
        "Apollo \(id)"
    }
}
