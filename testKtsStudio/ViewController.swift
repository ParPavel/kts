//
//  ViewController.swift
//  testKtsStudio
//
//  Created by Pavel Scope on 10/12/2018.
//  Copyright © 2018 Pavel Scope. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = ServerManager.shared.searchMovie(nameFilm: "Jack+Reacher")
        print("\(a)")
}
    
    func createAlert(message:String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
