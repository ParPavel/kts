//
//  MainViewController.swift
//  testKtsStudio
//
//  Created by Pavel Scope on 11/12/2018.
//  Copyright © 2018 Pavel Scope. All rights reserved.
//

import UIKit
import Foundation

class SearchViewController: UITableViewController, UISearchBarDelegate {
    
    var nameMovieArray: [String] = []
    var ids : Int = 0
    var names: String = ""
    var movies: [MovieFromServer] = []
    var image: [UIImage] = []
    var searchName: String?
    
   // MARK: ----UITableViewDataSource
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count;
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Identifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if indexPath.row < self.movies.count {
            cell.textLabel?.text =  self.movies[indexPath.row].title
        }
        return cell
    }
    
    // MARK: ----UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let contentVC = storyboard.instantiateViewController(withIdentifier: "contentViewController") as? СontentViewController else {
            return
        }
        contentVC.movie = self.movies[indexPath.row]
        self.navigationController?.pushViewController(contentVC, animated: true)
    }
    
    // MARK: ----UISearchBarDelegate
    
    private var enOrRu = true
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let characterset = CharacterSet(charactersIn: "абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ")
        if searchText.rangeOfCharacter(from: characterset) != nil {
            if self.enOrRu {
                self.createAlert(message: "вводи английские буквы")
                self.enOrRu = false
            }
        } else {
            self.enOrRu = true
            let text = searchText.replacingOccurrences(of: " ", with: "+")
            ServerManager.shared.searchMovie(nameFilm: text) { (searchMovies) in
                guard let movies =  searchMovies.movies else { return }
                self.movies = movies;
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: ----Alert
    func createAlert(message:String) {
        let alert = UIAlertController(title: "Друг", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

