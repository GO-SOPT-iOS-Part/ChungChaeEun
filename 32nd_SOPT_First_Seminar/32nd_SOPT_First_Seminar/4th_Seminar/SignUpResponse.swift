//
//  SignUpResponse.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/06.
//

import Foundation

// MARK: - SignUpResponse
struct SignUpResponse: Codable {
    let code: Int
    let success : Bool?
    let message: String
    let data: SignUpData
}

// MARK: - SignUpData
struct SignUpData: Codable {
    let userID: Int
    let nickname: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case nickname
    }
}
