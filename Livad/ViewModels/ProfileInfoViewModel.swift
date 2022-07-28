//
//  ProfileInfoViewModel.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/1/22.
//

import Foundation
import Auth0

class ProfileInfoViewModel: ObservableObject {
    //    @Published var streamer = Streamer(firstName: "", lastName: "", contactEmail: "", phone: "", discordUsername: "", broadcastingLanguage: "", broadcastingLanguageID: "", gender: "", country: "", instagramUsername: "", twitterUsername: "", city: "", birthDate: "", broadcastingSoftware: "", languagePreference: "", countryID: "", phoneCode: "", genderDetail: "", setupPreviewConfirmed: 0)
    @Published var countries: [Country] = []
    @Published var countryPhones: [String] = []
    @Published var cityDictionary: [Int: String] = [:]
    @Published var countryDictionary: [String: String] = [:]
    @Published var phoneDictionary: [String: Int] = [:]
    @Published var cities: [String] = []
    
    func getCountries(credentials: Credentials) {
        let url = "https://streamer.api.livad.stream/countries"
        guard let request = LivadService.shared.actionSession(with: url, credentials: credentials, action: "GET", for: nil) else { return }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print("RESPONSE:", response)
            }
            if let data = data {
                do {
                    let resultCountries = try JSONDecoder().decode(CountryResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.countries.append(contentsOf: resultCountries.countries.values)
                        for country in self.countries.sorted(by: { $0.name > $1.name }) {
                            let phoneCode = "\(country.name) +\(country.phoneCode)  "
                            self.countryPhones.append(phoneCode)
                            self.phoneDictionary[country.name] = country.phoneCode
                        }
                        
                        for country in resultCountries.countriesArray {
                            print("CountryArray:", country)
                            self.countryDictionary[country.label] = country.value
                        }
                        
                        print("Country Dictionary:", self.countryDictionary)
                        print("CountryIDS:", resultCountries.countriesArray)
                    }
                } catch {
                    print("ERROR", error)
                }
            }
        }.resume()
    }
    func getCities(credentials: Credentials, country_id: String) {
        
        let url = "https://streamer.api.livad.stream/countries/\(country_id)/cities"
        guard let request = LivadService.shared.actionSession(with: url, credentials: credentials, action: "GET", for: nil) else { return }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request) { data, response, error in
            if let response = response {
                print("RESPONSE: ", response)
            }
            if let data = data {
                do {
                    let resultCities = try JSONDecoder().decode(CityResponse.self, from: data)
                    DispatchQueue.main.async {
                        for city in resultCities.citiesArray {
                            self.cityDictionary[city.value] = city.label
                            self.cities.append(city.label)
                        }
                        print("CITY Dictionary",self.cityDictionary)
                    }
                } catch {
                    print("ERROR: ", error)
                }
            }
        }.resume()
        
    }
    
    func getYears() -> [String] {
        var years = [String]()
        for i in 1947...2007 {
            years.append(String(i))
        }
        return years
    }
    
    func getMonths() -> [String] {
        return ["January", "Febrary", "March", "April","May","June","July","August","September","October","November","December"]
    }
    
    func getDays() -> [String] {
        var days = [String]()
        for i in 1...31 {
            days.append(String(i))
        }
        return days
    }
    
    
    
    
    // There is a bug here. You need to re-configure this functionality.!
    
    //    func putStreamer(credentials: Credentials) {
    //        let url = "https://streamer.api.livad.stream/streamers"
    //        guard let data = try? JSONEncoder().encode(streamer) else {
    //            print("Error: Trying to convert model to JSON data")
    //            return
    //        }
    //
    //        guard let request = LivadService.shared.actionSession(with: url, credentials: credentials, action: "PUT", for: nil) else { return }
    //        URLSession.shared.uploadTask(with: request, from: data) { data, response, error in
    //
    //            if let response = response {
    //                print("RESPONSE: ", response)
    //            }
    //            guard error == nil else {
    //                print("Error: error calling PUT")
    //                print(error!)
    //                return
    //            }
    //            guard let data = data else {
    //                print("Error: Did not receive data")
    //                return
    //            }
    //            do {
    //                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
    //                    print("Error: Cannot convert data to JSON object")
    //                    return
    //                }
    //                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
    //                    print("Error: Cannot convert JSON object to Pretty JSON data")
    //                    return
    //                }
    //                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
    //                    print("Error: Could print JSON in String")
    //                    return
    //                }
    //
    //                print(prettyPrintedJson)
    //            } catch {
    //                print("Error: Trying to convert JSON data to string")
    //                return
    //            }
    //        }.resume()
    //    }
    
}

//    func handleCredentials(completion: @escaping (Credentials) -> Void) {
//        credentialsManager.credentials { result in
//            switch result{
//            case .success(let credentials):
//                completion(credentials)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
