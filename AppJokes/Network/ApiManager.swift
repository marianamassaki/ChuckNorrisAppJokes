//
//  ApiManager.swift
//  AppJokes
//
//  Created by Mariana Eri Massaki on 28/05/22.
//

import Alamofire

class ApiManager {
    
    func getRandonJokes(completion: @escaping (Jokes?, Bool) -> Void) {
        
        let url = "https://api.chucknorris.io/jokes/random"
        
        AF.request(url).response { response in
            
            if response.response?.statusCode == 200 {
                
                if let data = response.data {
                    
                    do {
                        
                        let result = try JSONDecoder().decode(Jokes.self, from: data)
                        
                        completion(result, true)
                        
                    } catch {
                        
                        completion(nil, false)
                    }
                    
                } else{
                    
                    completion(nil, false)
                }
                
            }
            
        }
        
    }
    
    func getSearchJokes(filterName: String, completion: @escaping (JokeName?, Bool) -> Void) {
        
        let url = "https://api.chucknorris.io/jokes/search?query=\(filterName)"
        
        AF.request(url).response { response in
            
            if response.response?.statusCode == 200 {
                
                if let data = response.data {
                    
                    do {
                        
                        let result = try JSONDecoder().decode(JokeName.self, from: data)
                        
                        completion(result, true)
                        
                    } catch {
                        completion(nil, false)
                    }
                }else {
                    completion(nil, false)
                }
            }
            
        }
        
    }
}
