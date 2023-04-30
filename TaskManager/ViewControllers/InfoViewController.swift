//
//  InfoViewController.swift
//  TaskManager
//
//  Created by Khusain on 30.04.2023.
//

import UIKit

class InfoViewController: UIViewController {

    
    
    @IBOutlet var personImages: [UIImageView]!
    
    override func viewWillAppear(_ animated: Bool) {
        for personImage in personImages {
            personImage.layer.cornerRadius = personImage.frame.width / 2
        }
    }
}
