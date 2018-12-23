//
//  mainTwoViewController.swift
//  testKtsStudio
//
//  Created by Pavel Scope on 12/12/2018.
//  Copyright © 2018 Pavel Scope. All rights reserved.
//

import UIKit

class mainTwoViewController: UIViewController {

    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var posterPathImageView: UIImageView!
    var movies: [resultType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        ServerManager.shared.searchMovie(nameFilm: "fight") { (movie) in
            guard let id =  movie.results else { return }
            self.movies = id;
        }  
    }
    

}

