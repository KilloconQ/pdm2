//
//  Modelo.swift
//  crud_api_feb_2022
//
//  Created by Alejandro Rincón
//

import Foundation

// MARK: - Registro
struct Register: Codable {
    let email, password: String
}

struct Response: Decodable {
    let id: Int
    let token: String
}
