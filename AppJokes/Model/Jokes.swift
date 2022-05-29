//
//  Jokes.swift
//  AppJokes
//
//  Created by Mariana Eri Massaki on 26/05/22.
//

import Foundation

class Jokes: Codable {
    
    let icon_url: String?
    let id: String?
    let url: String?
    let value: String?
    
    init(icon_url: String?, id: String?, url: String?, value: String?) {
        self.icon_url = icon_url
        self.id = id
        self.url = url
        self.value = value
    }
}
