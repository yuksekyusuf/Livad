//
//  ProfileInfoViewModel.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/1/22.
//

import Foundation
import Auth0

class ProfileInfoViewModel: ObservableObject {
    @Published var setting = Setting(firstName: "", lastName: "", contactEmail: "", phone: "", discordUsername: "", gender: "", broadcastingLanguage: "", genderDetail: "", broadcastingLanguageID: "", country: "", city: "", instagramUsername: "", twitterUsername: "", birthDate: "", broadcastingSoftware: "", modSet: 0, countryID: "", countryName: "", cityID: 0, cityName: "", phoneCode: 0, setupPreviewConfirmed: "", birthDateDisplay: "", countryDisplay: CountryDisplay(value: "", label: ""), cityDisplay: Display(value: 0, label: ""), phoneCodeDisplay: Display(value: 0, label: ""))
    
    @Published var countries: [Country] = []
    @Published var countryPhones: [String] = []
    @Published var cities: [City] = []
    @Published var countryDictionary: [String: String] = [:]
    
    
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
                    for country in resultCountries.countriesArray {
                        self.countryDictionary[country.value] = country.label
                    }
                    
                    
                    DispatchQueue.main.async {
                        self.countries.append(contentsOf: resultCountries.countries.values)
                        for country in self.countries.sorted(by: { $0.name > $1.name }) {
                            let phoneCode = "\(country.name) +\(country.phoneCode)  "
                            self.countryPhones.append(phoneCode)
                        }
                        
//                        print("Country:", resultCountries.countries.values.first)
                        print("CountryIDS:", resultCountries.countriesArray)
                    }
                } catch {
                    print("ERROR", error)
                }
            }
        }.resume()
    }
    func getCities(credentials: Credentials, country_id: Int) {
        
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
                        self.cities.append(resultCities.cities.id)
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
