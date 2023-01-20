//
//  RulesViewControllers.swift
//  Cow Cemetery
//
//  Created by Ben Gauger on 1/20/23.
//

import Foundation
import UIKit


class RulesViewController: UIViewController {
    
    @IBOutlet weak var cowCemteryRules: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        cowCemteryRules.font = UIFont.systemFont(ofSize: 65.0)
        
        cowCemteryRules.text = "Welcome to Cow Cemtery! \n\n Based of a (very) Midwestern driving game, you'll entertain yourself for long road trips. The rules are simple. On your side of the vehicle, you count your own cows. Enter the number and they will automatically be added to your total. \n\n 🐮 = 1 cow, up till you reach ten. After that, 🐄 is used for every ten cows so not to clutter up the screen. \n\n However, if your opponent spots a cemtery on YOUR side of the road, you will lose half your cows. You don't have to point out any cemeteries you see on your side. Why would you want to hurt your own chances of winning? \n\n A 🪦 will appear below your cows to show you how many cemteries you've passed, if you're curious. \n\n Good luck and have fun!"
        
        
    }
    
   
    
    
    
}
