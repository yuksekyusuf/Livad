//
//  InterestResponse.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/5/22.
//

import Foundation

struct Interests: Codable {
    let data: [Interest]
}

// MARK: - Datum
struct Interest: Codable {
    let id: Int
    let name, image: String
}
