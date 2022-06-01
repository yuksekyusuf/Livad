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
//        let url = String(format: url)
//        //Fix this forced wrapping!!!
        let serviceUrl = URL(string: url)!
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = actionType
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(credentials.accessToken)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    func actionSession(with url: String, accessToken: String, action actionType: String, for data: Data?) -> URLRequest? {
//        let url = String(format: url)
//        //Fix this forced wrapping!!!
        let serviceUrl = URL(string: url)!
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = actionType
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    
    
    
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
//
    
}