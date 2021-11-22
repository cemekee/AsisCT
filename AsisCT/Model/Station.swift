//
//  Station.swift
//  AsisCT
//
//  Created by Cem Eke on 19.11.2021.
//

import Foundation

struct Station: Codable {
    let stationName, stationCode: String
    let location: Location
    let buses: [Bus]
}

