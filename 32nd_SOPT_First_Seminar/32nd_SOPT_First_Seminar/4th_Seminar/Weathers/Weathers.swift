//
//  Weathers.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/07.
//

import Foundation

struct Weathers: Codable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
}

struct Weather: Codable {
    let id: Int
    let main: String
    let descript: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case main
        case descript = "description"
        case icon
    }
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Wind: Codable {
    let speed: Double
}
