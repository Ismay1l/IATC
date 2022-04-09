//
//  ViewController.swift
//  Session1
//
//  Created by Ismayil Ismayilov on 09.04.22.
//

import UIKit

class ViewController: UIViewController {

    let myLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .darkGray
        print("Height: \(self.view.frame.height)")
        print("Width: \(self.view.frame.width)")
        
        myLabel.frame = CGRect.init(x: 170, y: 400, width: 100, height: 30)
        myLabel.text = "Test1"
        myLabel.textColor = .orange
        myLabel.backgroundColor = .lightGray
        myLabel.textAlignment = .center
        myLabel.font = .boldSystemFont(ofSize: 30)
        self.view.addSubview(myLabel)
        
        let myButton = UIButton()
        myButton.setTitle("Save", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        myButton.frame = CGRect.init(x: 185, y: 500, width: 100, height: 50)
        myButton.backgroundColor = .black
        myButton.addTarget(self, action: #selector(saveAction), for: UIControl.Event.touchUpInside)
        self.view.addSubview(myButton)
    }
    
    @objc func saveAction () {
        myLabel.text = "Saved"
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

