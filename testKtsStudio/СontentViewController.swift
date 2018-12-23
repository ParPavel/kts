//
//  СontentViewController.swift
//  testKtsStudio
//
//  Created by Pavel Scope on 12/12/2018.
//  Copyright © 2018 Pavel Scope. All rights reserved.
//

import UIKit

class СontentViewController: UIViewController {
    @IBOutlet weak var tittleNavigationItem: UINavigationItem!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var buttonAdd: UIBarButtonItem!
    public var movie: MovieFromServer?
    public var dataForCoreData: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tittleNavigationItem.title = self.movie?.title
        self.overviewTextView.text = self.movie?.overview
        guard let posterPath = self.movie?.posterPath else {
            return
        }
        ServerManager.shared.getImage(posterPath: posterPath) { (data) in
            self.dataForCoreData = data
            DispatchQueue.main.async {
                self.posterImageView.image = UIImage.init(data: data)
            }
        }
        
        guard let resultData = DataManager.shared.result else { return }
        for object in resultData {
            if self.movie?.title == object.value(forKey: "tittle") as? String{
                self.buttonAdd.isEnabled = false
            } 
        }
        
    }
    
    @IBAction func addMovieInDataAction(_ sender: Any) {
        guard let title =  self.movie?.title
            , let overview = self.overviewTextView.text
            , let data = self.dataForCoreData
            else {
                print("nil data or overview or tittle")
                return
        }
        if self.buttonAdd.isEnabled {
            DataManager.shared.createData(title: title, overview: overview, dataForCoreData: data)
            self.buttonAdd.isEnabled = false
        }
    }
}
