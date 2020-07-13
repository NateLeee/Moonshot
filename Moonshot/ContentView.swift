//
//  ContentView.swift
//  Moonshot
//
//  Created by Nate Lee on 7/13/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct Person: Codable {
    var name: String
    var address: Address
}

struct Address: Codable {
    var street: String
    var city: String
}

struct ContentView: View {
    var input = """
    {
        "name": "Taylor Swift",
        "address": {
            "street": "555, Taylor Swift Avenue",
            "city": "Nashville"
        }
    }
    """
    
    var body: some View {
        Button("Decode JSON") {
            let data = Data(self.input.utf8)
            
            let jsonDecoder = JSONDecoder()
            if let person = try? jsonDecoder.decode(Person.self, from: data) {
                print("\(person.address.street) - \(person.address.city)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
