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
    
    var jokeDetail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelPiadaDetail.text = jokeDetail ?? ""
        
        // Do any additional setup after loading the view.
    }
    

}
