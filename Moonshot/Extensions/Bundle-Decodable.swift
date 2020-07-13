//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Nate Lee on 7/13/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import Foundation

extension Bundle {
    func decode(_ fileName: String) -> [Astronaut] {
        guard let jsonFileUrl = url(
            forResource: fileName.contains(".") ? fileName.components(separatedBy: ".")[0] : fileName,
            withExtension: fileName.contains(".") ? fileName.components(separatedBy: ".")[1]: "json"
            ) else {
                fatalError("Failed to locate \(fileName) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: jsonFileUrl) else {
            fatalError("Failed to load \(fileName) in bundle.")
        }
        
        guard let astronauts = try? JSONDecoder().decode([Astronaut].self, from: data) else {
            fatalError("Failed to decode \(fileName).")
        }
        
        return astronauts
    }
}
