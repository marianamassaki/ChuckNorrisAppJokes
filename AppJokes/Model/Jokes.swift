//
//  Jokes.swift
//  AppJokes
//
//  Created by Mariana Eri Massaki on 28/05/22.
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


//"icon_url" : "https://assets.chucknorris.host/img/avatar/chuck-norris.png",
//"id" : "F0Iph6K_SUG-sgLu4d4GbA",
//"url" : "https://api.chucknorris.io/jokes/F0Iph6K_SUG-sgLu4d4GbA",
//"value" : "The 'Fifty Shades of Grey' trilogy is loosly based on Chuck Norris' prepubescent years."
//}
