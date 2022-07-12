//
//  SignUpViewModel.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/5/22.
//

import Foundation

class SignUpTabViewModel: ObservableObject {
    
    @Published var streamer = Streamer(firstName: "", lastName: "", contactEmail: "", phone: "", discordUsername: "", broadcastingLanguage: "", broadcastingLanguageID: "", gender: "", country: "", instagramUsername: "", twitterUsername: "", city: "", birthDate: "", broadcastingSoftware: "", languagePreference: "", countryID: "", phoneCode: "", genderDetail: "", setupPreviewConfirmed: 0)
    
    @Published var isProfileInfoValidated: Bool = false
    @Published var isSocialMediaValidated: Bool = false
    @Published var isStreamSettingsValidated: Bool = false
    @Published var isInterestsValidated: Bool = false
    
    
    init() {
    }
    
    //MARK: - Profile Info Validation Functions
    
    func isFirstNameValid() -> Bool {
        // criteria in regex. See http://regexlib.com
        let firstNameTest = NSPredicate(format: "SELF MATCHES %@", "^[a-zA-Z]+((\\s|\\-)[a-zA-Z]+)?$")
        return firstNameTest.evaluate(with: streamer.firstName)
    }
    
    func isLastNameValid() -> Bool {
        // criteria in regex. See http://regexlib.com
        let lastNameTest = NSPredicate(format: "SELF MATCHES %@", "^[a-zA-Z]+((\\s|\\-)[a-zA-Z]+)?$")
        return lastNameTest.evaluate(with: streamer.lastName)
    }
    
    func isEmailValid() -> Bool {
        // criteria in regex. See http://regexlib.com
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$")
        return emailTest.evaluate(with: streamer.contactEmail)
    }
    
    func isGenderValid() -> Bool {
        if streamer.gender.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func isPhoneValid() -> Bool {
        // criteria in regex. See http://regexlib.com
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", "^(1?(-?\\d{3})-?)?(\\d{3})(-?\\d{4})$")
        return phoneTest.evaluate(with: streamer.phone)
    }
    
    func isDOBValid() -> Bool {
        // criteria in regex. See http://regexlib.com
        let dobTest = NSPredicate(format: "SELF MATCHES %@", "^\\d{4}[\\-\\/\\s]?((((0[13578])|(1[02]))[\\-\\/\\s]?(([0-2][0-9])|(3[01])))|(((0[469])|(11))[\\-\\/\\s]?(([0-2][0-9])|(30)))|(02[\\-\\/\\s]?[0-2][0-9]))$")
        return dobTest.evaluate(with: streamer.birthDate)
    }
    
    func isCountryValid() -> Bool {
        if streamer.country.isEmpty {
            return false
        } else {
            return true
        }
    }
    func isCityValid() -> Bool {
        if streamer.city.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func isDiscordValid() -> Bool {
        // criteria in regex. See http://regexlib.com
        let discordTest = NSPredicate(format: "SELF MATCHES %@", ".+#\\d{4}")
        return discordTest.evaluate(with: streamer.discordUsername)
    }
    
    func isSoftwareValid() -> Bool {
        if streamer.broadcastingSoftware.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func isLanguageValid() -> Bool {
        if streamer.broadcastingLanguage.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    var isSignUpComplete: Bool {
        if !isProfileInfoValidated ||
            !isSocialMediaValidated ||
            !isStreamSettingsValidated ||
            isInterestsValidated {
            return false
        }
        return true
    }
    
}
