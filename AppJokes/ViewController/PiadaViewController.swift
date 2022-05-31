//
//  PiadaViewController.swift
//  AppJokes
//
//  Created by Mariana Eri Massaki on 25/05/22.
//

import UIKit

class PiadaViewController: UIViewController {

    @IBOutlet weak var labelPiadaDetail: UILabel!
    @IBOutlet weak var imagemDetail: UIImageView!
    
    var jokeDetail: Jokes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let joke = jokeDetail {
            self.labelPiadaDetail.text = joke.value
        }
    }
}
