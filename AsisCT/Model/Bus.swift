//
//  Bus.swift
//  AsisCT
//
//  Created by Cem Eke on 19.11.2021.
//

import Foundation

struct Bus: Codable {
    let remainingTime: Int
    let plate, routeCode: String
    let icon: String
    let location: Location
}

