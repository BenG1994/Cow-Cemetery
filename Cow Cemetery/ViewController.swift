//
//  ViewController.swift
//  Cow Cemetery
//
//  Created by Ben Gauger on 1/13/23.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var playerOneNameText: UITextField!
    @IBOutlet weak var numberOfCowsPlayerOne: UILabel!
    @IBOutlet weak var playerOneCows: UILabel!
    @IBOutlet weak var playerTwoNameText: UITextField!
    @IBOutlet weak var numberOfCowsPlayerTwo: UILabel!
    @IBOutlet weak var playerTwoCows: UILabel!
    @IBOutlet weak var playerOneCemeteries: UILabel!
    @IBOutlet weak var playerTwoCemeteries: UILabel!
    
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerOneNameText.delegate = self
        playerTwoNameText.delegate = self
        
        playerOneNameText.text = userDefaults.value(forKey: "PlayerOneName") as? String ?? "Player 1"
        playerTwoNameText.text = userDefaults.value(forKey: "PlayerTwoName") as? String ?? "Player 2"
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    

//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height
//            }
//        }
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if self.view.frame.origin.y != 0 {
//            self.view.frame.origin.y = 0
//        }
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    
    
    
    
    
    
    
    
    @IBAction func playerOneSawCows(_ sender: UIButton) {
    }
    
    
    @IBAction func playerOneCemetery(_ sender: UIButton) {
    }
    
    
    @IBAction func playerTwoSawCows(_ sender: UIButton) {
    }
    
    @IBAction func playerTwoCemetery(_ sender: UIButton) {
    }
    
    
    
    
    
}


extension ViewController: UITextFieldDelegate{
    
    @IBAction func playerOneName(_ sender: UITextField) {
        
        
        
//        print(playerOneNameText.text!)
//        playerOneNameText.text = ""
        
        
//        func textFieldShouldReturn(_ playerOneNameText: UITextField) -> Bool {
//            playerOneNameText.resignFirstResponder()
//        }
        
    }
    
    @IBAction func playerTwoName(_ sender: UITextField) {
        print (playerTwoNameText.text!)
  
    }
    
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        let newPlayerOneName = playerOneNameText.text
        print(newPlayerOneName!)
        userDefaults.set(newPlayerOneName, forKey: "PlayerOneName")
        print(userDefaults.value(forKey: "PlayerOneName")!)
        
        let newPlayerTwoName = playerTwoNameText.text
        print (newPlayerTwoName!)
        userDefaults.set(newPlayerTwoName, forKey: "PlayerTwoName")
        print(userDefaults.value(forKey: "PlayerTwoName")!)
        
        
        ////        let newPlayerTwoName = playerTwoNameText.text
        ////        print(newPlayerTwoName!)
        ////        userDefaults.set(newPlayerTwoName, forKey: "PlayerTwoName")
        ////        print(userDefaults.value(forKey: "PlayerTwoName")!)
        //    }
        //
        //    @IBAction func playerTwoName(_ sender: UITextField) {
        //
        //        self.playerTwoNameText.delegate = self
        //
        //        print(playerTwoNameText.text!)
        //        playerTwoNameText.text = ""
        //
        //    }
        
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == playerOneNameText) {
            playerOneNameText.text = ""
        }
        else if (textField == playerTwoNameText) {
            playerTwoNameText.text = ""
        }else {
            print("No players")
        }
    }
    
}
