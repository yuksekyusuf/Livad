//
//  Setting.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/1/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let setting = try? newJSONDecoder().decode(Setting.self, from: jsonData)

import Foundation

// MARK: - Setting
struct Setting: Codable {
    var firstName, lastName, contactEmail, phone: String
    var discordUsername, gender, broadcastingLanguage: String
    var genderDetail: String
    var broadcastingLanguageID, country, city, instagramUsername: String
    var twitterUsername, birthDate, broadcastingSoftware: String
    var modSet: Int
    var countryID, countryName: String
    var cityID: Int
    var cityName: String
    var phoneCode: Int
    var setupPreviewConfirmed, birthDateDisplay: String
    var countryDisplay: CountryDisplay
    var cityDisplay, phoneCodeDisplay: Display

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case contactEmail = "contact_email"
        case phone
        case discordUsername = "discord_username"
        case gender
        case genderDetail = "gender_detail"
        case broadcastingLanguage = "broadcasting_language"
        case broadcastingLanguageID = "broadcasting_language_id"
        case country, city
        case instagramUsername = "instagram_username"
        case twitterUsername = "twitter_username"
        case birthDate = "birth_date"
        case broadcastingSoftware = "broadcasting_software"
        case modSet = "mod_set"
        case countryID = "country_id"
        case countryName = "country_name"
        case cityID = "city_id"
        case cityName = "city_name"
        case phoneCode = "phone_code"
        case setupPreviewConfirmed = "setup_preview_confirmed"
        case birthDateDisplay = "birth_date_display"
        case countryDisplay = "country_display"
        case cityDisplay = "city_display"
        case phoneCodeDisplay = "phone_code_display"
    }
}

// MARK: - Display
struct Display: Codable {
    let value: Int
    let label: String
}

// MARK: - CountryDisplay
struct CountryDisplay: Codable {
    let value, label: String
}

