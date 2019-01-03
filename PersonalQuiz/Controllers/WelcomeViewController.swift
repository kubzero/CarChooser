//
//  WelcomeViewController.swift
//  PersonalQuiz
//
//  Created by Andrew on 10/12/2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit
import SpriteKit

class WelcomeViewController: UIViewController {
    var groun = SKSpriteNode()
    
    @IBOutlet var btn: UIButton!
    @IBOutlet var question: UILabel!
    @IBOutlet var bckgImage: UIImageView!
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImage(named: "background")
        bckgImage.image = backgroundImage
        bckgImage.contentMode = .scaleAspectFill
        bckgImage.alpha = 0.5
    
    }
    

    
    
    
    
    
    

    }

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
