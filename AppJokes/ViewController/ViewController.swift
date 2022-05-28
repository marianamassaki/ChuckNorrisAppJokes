//
//  ViewController.swift
//  AppJokes
//
//  Created by Mariana Eri Massaki on 25/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imagemHome: UIImageView!
    @IBOutlet weak var piadaHome: UILabel!
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var buscarPiadaButton: UIButton!
    
    let apiManager = ApiManager()
    var joke: Jokes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedMyShufflerButton(_ sender: UIButton) {
        
        getJoke()
    }
    
    @IBAction func tappedMyBuscarPiadaButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "SearchViewController", sender: self)
    }
        
    
    
    func getJoke() {
            
            apiManager.getRandonJokes { (result, hasData) in
                if hasData{
                    
                    if let result = result {
                        
                        self.joke = result
                        self.piadaHome.text = self.joke?.value
       //                 print(self.joke?.icon_url)
                        
                    }else{
                        print("mostrar erro pro usuario")
                    }
                }else{
                    
                    print("Mostrar erro pro usuario")
                }
                
            }
            
        }
        
    }
    


