//
//  ViewController.swift
//  Session1
//
//  Created by Ismayil Ismayilov on 09.04.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .darkGray
        print("Height: \(self.view.frame.height)")
        print("Width: \(self.view.frame.width)")
        
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 170, y: 400, width: 80, height: 30)
        myLabel.text = "Test1"
        myLabel.textColor = .orange
        myLabel.backgroundColor = .lightGray
        myLabel.textAlignment = .center
        myLabel.font = .boldSystemFont(ofSize: 30)
        self.view.addSubview(myLabel)
        
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Did appear")
    }


}

