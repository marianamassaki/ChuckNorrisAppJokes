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

    }
    

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = ""
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "PiadaViewController", sender: nil)

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
    
}


func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    
}

        
       
    
}
