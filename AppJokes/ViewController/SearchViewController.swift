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
    
    let apiManager = ApiManager()
    var joke: Jokes?
    var jokeNames: JokeName?
    var arrayResult: [Jokes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
    }
    
    func setupDelegates() {
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.searchPiada.delegate = self
    }
    
    func filterJokes(inputUsuario: String) {
        
        apiManager.getSearchJokes(filterName: inputUsuario) { (result, haveData) in
            
            if haveData{
                
                if let jokes = result {
                    
                    self.arrayResult = jokes.result
                    self.myTableView.reloadData()
                }else {
                    print("mostrar erro pro usuario")
                }
                
                
            }else {
                print("mostrar erro pro usuario")
            }
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.arrayResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = self.arrayResult[indexPath.row].value
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let jokeDetail: Jokes = self.arrayResult[indexPath.row]
        performSegue(withIdentifier: "PiadaViewController", sender: jokeDetail)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PiadaViewController" {
            let vc: PiadaViewController? = segue.destination as? PiadaViewController
            
            vc?.jokeDetail = sender as? Jokes
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filterJokes(inputUsuario: searchBar.text ?? "")
        
        if searchBar.becomeFirstResponder() {
            searchBar.resignFirstResponder()
        }
    }
}
