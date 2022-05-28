//
//  Service.swift
//  AppJokes
//
//  Created by Mariana Eri Massaki on 28/05/22.
//

import Foundation
import Alamofire

class Service {
    
    private var baseUrl = "https://api.chucknorris.io/jokes/random"
    
    init(baseUrl: String) {
        
        self.baseUrl = baseUrl
    }
    
    
    func getAllJokes(endPoint: String) {
        
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (response) in
            
            
            
            
            
            guard let data = response.data else {return}
            
            if response.response?.statusCode == 200 {
                
                print("Status code = \(response.response?.statusCode)")
                
                
                
            }
            
            
        }
    }
}
