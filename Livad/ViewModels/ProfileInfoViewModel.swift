//
//  ProfileInfoViewModel.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/1/22.
//

import Foundation
import Auth0

class ProfileInfoViewModel: ObservableObject {
    @Published var streamer = Streamer(firstName: "", lastName: "", contactEmail: "", phone: "", discordUsername: "", broadcastingLanguage: "", broadcastingLanguageID: "", gender: "", country: "", instagramUsername: "", twitterUsername: "", city: "", birthDate: "", broadcastingSoftware: "", languagePreference: "", countryID: "", phoneCode: "", genderDetail: "", setupPreviewConfirmed: 0)
    @Published var countries: [Country] = []
    @Published var countryPhones: [String] = []
    @Published var cityDictionary: [Int: String] = [:]
    @Published var countryDictionary: [String: String] = [:]
    @Published var phoneDictionary: [String: Int] = [:]
    @Published var cities: [String] = []
    
    
    init() {
    }
    
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
        let Months = ["January","Febrary","March","April","May","June","July","August","September","October","November","December"]
        var monthsInPickerView: [String]!
        let calendar = Calendar.current
        let month = calendar.dateComponents([.month], from: Date()).month!
        monthsInPickerView = Array(Months.dropFirst(month - 1))
        return monthsInPickerView
    }
    
    func getDays() -> [String] {
        var days = [String]()
        for i in 1...31 {
            days.append(String(i))
        }
        return days
    }
    


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
