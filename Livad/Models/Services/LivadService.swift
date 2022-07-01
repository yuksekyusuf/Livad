//
//  NetworkService.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/1/22.
//

import Foundation
import Auth0


class LivadService {
    
    static let shared = LivadService()
    
    func actionSession(with url: String, credentials: Credentials, action actionType: String, for data: Data?) -> URLRequest? {
        let serviceUrl = URL(string: url)!
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = actionType
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(credentials.accessToken)", forHTTPHeaderField: "Authorization")
        if let data = data {
            request.httpBody = data
        }
        return request
    }
    
//
//
//        let session = URLSession(configuration: URLSessionConfiguration.default)
//        session.dataTask(with: request) { (data, response, error) in
//            if let response = response {
//                print("RESPONSE:", response)
//            }
//            if let data = data {
//                do {
//                    let gitData = try JSONDecoder().decode(LoginData.self, from: data)
//
//                } catch {
//                    print("ERROR", error)
//                }
//            }
//        }.resume()
//    }

    
}
