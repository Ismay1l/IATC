//
//  DetailsVC.swift
//  SimpsonBook
//
//  Created by Ismayil Ismayilov on 12.04.22.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var selectedSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        image.image = selectedSimpson?.image
    }
    

    

}
