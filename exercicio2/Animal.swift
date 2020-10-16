//
//  Animal.swift
//  exercicio2
//
//  Created by Paola Pagotto on 06/10/2020.
//  Copyright © 2020 Paola Pagotto. All rights reserved.
//

import Foundation

class Animal {
    var name: String
    var breed: String
    var specie: String
    var net: String
    var image: String
    
    init(name: String, breed: String, specie: String, net: String, image: String) {
        self.name = name
        self.breed = breed
        self.specie = specie
        self.net = net
        self.image = image
    }
}
