//
//  SavedСontentViewController.swift
//  testKtsStudio
//
//  Created by Pavel Scope on 20/12/2018.
//  Copyright © 2018 Pavel Scope. All rights reserved.
//

import UIKit

class SavedСontentViewController: UIViewController {
    
    @IBOutlet weak var tittleUINavigationItem: UINavigationItem!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewTextView: UITextView!
    
    public var overviewText: String = ""
    public var dataImage: Data?
    public var nameFilm: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let data = self.dataImage else { return }
        self.posterImageView.image = UIImage.init(data: data)
        self.overviewTextView.text = self.overviewText
        self.tittleUINavigationItem.title = nameFilm
    }
}
