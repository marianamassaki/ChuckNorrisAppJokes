//
//  JokeName.swift
//  AppJokes
//
//  Created by Mariana Eri Massaki on 28/05/22.
//

import Foundation

class JokeName: Codable {
    
    let total: Int?
    let result: [Jokes]
    
    init(total: Int?, result: [Jokes]) {
        self.total = total
        self.result = result
    }
}
