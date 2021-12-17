//
//  Character.swift
//  The Feline Order
//
//  Created by Alex Gonzalez on 12/16/21.
//

import Foundation

struct Character: Identifiable, Codable {
    var id = UUID()
    var name: String
    var height: String
    var mass: String
    var hair_color: String
    var skin_color: String
    var eye_color: String
    var birth_year: String
    var gender: String
    var image: String
}
