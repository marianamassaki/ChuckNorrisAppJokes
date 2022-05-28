//
//  SearchViewController.swift
//  AppJokes
//
//  Created by Mariana Eri Massaki on 25/05/22.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var labelSearch: UILabel!
    @IBOutlet weak var searchPiada: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    
    var filterJoke: [String] = []
    
    let apiManager = ApiManager()
    var joke: Jokes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.searchPiada.delegate = self

        // Do any additional setup after loading the view.
    }
    

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.filterJoke[indexPath.row]
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectJoke = self.filterJoke[indexPath.row]
        performSegue(withIdentifier: "PiadaViewController", sender: selectJoke)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PiadaViewController" {
            let vc: PiadaViewController? = segue.destination as? PiadaViewController
            
            vc?.jokeDetail = sender as? String
        }
    }

    
}


extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        
        
        
//    self.filterJoke = []
//
//    if searchText.isEmpty{
//        self.filterJoke = self.words
//    }else {
//
//        for value in {
//            if value.uppercased().contains(searchText.uppercased()){
//                self.filterJoke.append(value)
//            }
//        }
//    }
//    self.myTablewView.reloadData()
}


func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    
    
    getJoke()
 //   searchBar.resignFirstResponder()
}
    func getJoke() {
            
            apiManager.getRandonJokes { (result, hasData) in
                if hasData{
                    
                    if let result = result {
                        
                        self.joke = result
                        self.searchPiada.text = self.joke?.value
                        print(self.joke?.icon_url)
                        
                    }else{
                        print("mostrar erro pro usuario")
                    }
                }else{
                    
                    print("Mostrar erro pro usuario")
                }
                
            }
            
        }
    
}



