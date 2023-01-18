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
    
    
    var cemeteryEmojis: [String] = []
    var cemeteryEmojisTwo: [String] = []
//    var cemeteryEmoji: [String] = UserDefaults.standard.object(forKey: "CemeteryEmoji")! as? [String] ?? []
//    var cemeteryEmoji: [String] = UserDefaults.standard.stringArray(forKey: "CemeteryEmoji") ?? []
    
    
    var cemeteryEmojiTwo: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerOneNameText.delegate = self
        playerTwoNameText.delegate = self
        
//        cemeteryEmojis = UserDefaults.standard.object(forKey: "CemeteryEmoji") as? [String] ?? []
//
//        print("\(UserDefaults.standard.object(forKey: "CemeteryEmoji")!) after userDefaults stuff")
//        print(cemeteryEmojis)
        
        playerOneNameText.text = userDefaults.value(forKey: "PlayerOneName") as? String ?? "Player 1"
        playerTwoNameText.text = userDefaults.value(forKey: "PlayerTwoName") as? String ?? "Player 2"
        
        if userDefaults.value(forKey: "TotalCows") != nil {
            numberOfCowsPlayerOne.text = "\(UserDefaults.standard.integer(forKey: "TotalCows")) cows"
        }else {
            numberOfCowsPlayerOne.text = "0 Cows"
        }
        
        if userDefaults.value(forKey: "TotalCowsTwo") != nil {
            numberOfCowsPlayerTwo.text = "\(UserDefaults.standard.integer(forKey: "TotalCowsTwo")) cows"
        }else {
            numberOfCowsPlayerTwo.text = "0 Cows"
        }
        
        
        if let emojis = userDefaults.array(forKey: "CemeteryEmoji") as? [String] {
               playerOneCemeteries.text = "\(emojis.joined())"
               cemeteryEmojis = emojis
               print(cemeteryEmojis)
           } else {
               playerOneCemeteries.text = ""
           }
        
        if let emojisTwo = userDefaults.array(forKey: "CemeteryEmojiTwo") as? [String] {
               playerTwoCemeteries.text = "\(emojisTwo.joined())"
               cemeteryEmojisTwo = emojisTwo
               print(cemeteryEmojisTwo)
           } else {
               playerTwoCemeteries.text = ""
           }
//        if UserDefaults.standard.object(forKey: "CemeteryEmoji").debugDescription.count != 0{
//            playerOneCemeteries.text = "\(UserDefaults.standard.object(forKey: "CemeteryEmoji")!)"
//            print(cemeteryEmoji)
//        }else {
//            playerOneCemeteries.text = ""
//        }
    
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    
    
    
    
    
    
    
    
    @IBAction func playerOneSawCows(_ sender: UIButton) {
        
        
        var textField = UITextField()
        

        
        let alert = UIAlertController(title: "Cows Spotted!", message: "How many cows did you see?", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Cows", style: .default) {(action) in
            
            //MARK: - first cows
            
            var totalCows = 0
            var additionalCows = 0
            let newCows = textField.text!
            let cowsNumber = Int(newCows)
            
            if self.numberOfCowsPlayerOne.text == "0 cows"{
                self.userDefaults.set(cowsNumber, forKey: "FirstCows")
                let firstCows = UserDefaults.standard.integer(forKey: "FirstCows")
                print(firstCows)
                totalCows += firstCows
                self.userDefaults.set(totalCows, forKey: "TotalCows")
                print(totalCows)
            
                self.numberOfCowsPlayerOne.text = "\(self.userDefaults.string(forKey: "FirstCows")!) cows"
            }else if self.numberOfCowsPlayerOne.text != "# of Cows"{
                additionalCows = cowsNumber!
                print(additionalCows)
                totalCows = UserDefaults.standard.integer(forKey: "TotalCows")
                totalCows += additionalCows
                print(totalCows)
                self.userDefaults.set(totalCows, forKey: "TotalCows")
                print(totalCows)
                self.numberOfCowsPlayerOne.text = "\(self.userDefaults.string(forKey: "TotalCows")!) cows"
                print("\(UserDefaults.standard.object(forKey: "CemeteryEmoji")!) after userDefaults stuff")
            }
        
        }
        
        
        
        
        
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = ""
            textField = alertTextField
            textField.keyboardType = UIKeyboardType.numberPad
            
            
        }
        
        alert.addAction(action)
        
        
        
        present (alert, animated: true, completion: nil)
        
        
        
    }
    
    
    
    @IBAction func playerOneCemetery(_ sender: UIButton) {
        
        let cemeteryCows = UserDefaults.standard.integer(forKey: "TotalCows") / 2
        self.userDefaults.set(cemeteryCows, forKey: "TotalCows")
        print(cemeteryCows)
        self.numberOfCowsPlayerOne.text = "\(self.userDefaults.string(forKey: "TotalCows")!) cows"
        

        addCemeteryEmoji()
        
        print(UserDefaults.standard.object(forKey: "CemeteryEmoji")!)
        
        func addCemeteryEmoji() {
            cemeteryEmojis.append("🪦")
            print(cemeteryEmojis)
            self.playerOneCemeteries.text = "\(cemeteryEmojis.joined())"
            userDefaults.set(cemeteryEmojis, forKey: "CemeteryEmoji")
        }
//        func addCemeteryEmoji() {
//
//            cemeteryEmojis.append("🪦")
////            self.userDefaults.set(cemeteryEmoji, forKey: "CemeteryEmoji")
//            print(cemeteryEmojis)
//            self.playerOneCemeteries.text = "\(cemeteryEmojis.joined())"
////            self.playerOneCemeteries.text = "\(UserDefaults.standard.object(forKey: "CemeteryEmoji"))"
//
//            userDefaults.set(cemeteryEmojis.joined(), forKey: "CemeteryEmoji")
////            cemeteryEmoji = UserDefaults.standard.object(forKey: "CemeteryEmoji") as! [String]
//            print(UserDefaults.standard.object(forKey: "CemeteryEmoji")!)
//            print("\(cemeteryEmojis.joined()) after userDefaults stuff")
//
//
//        }
        
    }
    
    
    @IBAction func playerTwoSawCows(_ sender: UIButton) {
        
        var textField = UITextField()
        
        //        textField.reloadInputViews()
        
        let alert = UIAlertController(title: "Cows Spotted!", message: "How many cows did you see?", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Cows", style: .default) {(action) in
            
            //MARK: - first cows
            
            var totalCows = 0
            var additionalCows = 0
            let newCows = textField.text!
            let cowsNumber = Int(newCows)
            
            if self.numberOfCowsPlayerTwo.text == "0 cows"{
                self.userDefaults.set(cowsNumber, forKey: "FirstCowsTwo")
                let firstCows = UserDefaults.standard.integer(forKey: "FirstCowsTwo")
                print(firstCows)
                totalCows += firstCows
                self.userDefaults.set(totalCows, forKey: "TotalCowsTwo")
                print(totalCows)
                //                let totalCows = firstCows
                //                self.userDefaults.set(0, forKey: "FirstAddition")
                //                self.userDefaults.set(0, forKey: "SecondCows")
                //                print(totalCows)
                self.numberOfCowsPlayerTwo.text = "\(self.userDefaults.string(forKey: "FirstCowsTwo")!) cows"
            }else if self.numberOfCowsPlayerTwo.text != "# of Cows"{
                additionalCows = cowsNumber!
                print(additionalCows)
                totalCows = UserDefaults.standard.integer(forKey: "TotalCowsTwo")
                totalCows += additionalCows
                print(totalCows)
                self.userDefaults.set(totalCows, forKey: "TotalCowsTwo")
                print(totalCows)
                self.numberOfCowsPlayerTwo.text = "\(self.userDefaults.string(forKey: "TotalCowsTwo")!) cows"
                //                self.userDefaults.set(cowsNumber, forKey: "AdditionalCows")
                //                let additionalCows = UserDefaults.standard.integer(forKey: "AdditionalCows")
                //                print(additionalCows)
                //
                //                let totalCows = totalCows + additionalCows
                //                print(totalCows)
                
            }
        
        }
        
        
        
        
        
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = ""
            textField = alertTextField
            textField.keyboardType = UIKeyboardType.numberPad
            
            
        }
        
        alert.addAction(action)
        
        
        
        present (alert, animated: true, completion: nil)
        
    }
    
    @IBAction func playerTwoCemetery(_ sender: UIButton) {
        
        let cemeteryCows = UserDefaults.standard.integer(forKey: "TotalCowsTwo") / 2
        self.userDefaults.set(cemeteryCows, forKey: "TotalCowsTwo")
        print(cemeteryCows)
        self.numberOfCowsPlayerTwo.text = "\(self.userDefaults.string(forKey: "TotalCowsTwo")!) cows"
        
//        cemeteryEmojiTwo.append("🪦")
             addCemeteryEmojiTwo()
     //        print(totalCemeteries!)
             
             
        func addCemeteryEmojiTwo() {
            cemeteryEmojisTwo.append("🪦")
            print(cemeteryEmojisTwo)
            self.playerTwoCemeteries.text = "\(cemeteryEmojisTwo.joined())"
            userDefaults.set(cemeteryEmojisTwo, forKey: "CemeteryEmojiTwo")
        }
             
//             func addCemeteryEmojiTwo() {
//
//                 cemeteryEmojiTwo.append("🪦")
//     //            self.userDefaults.set(cemeteryEmoji, forKey: "CemeteryEmoji")
//                 print(cemeteryEmojiTwo)
//                 self.playerTwoCemeteries.text = "\(cemeteryEmojiTwo.joined())"
//                 userDefaults.set(cemeteryEmojiTwo, forKey: "CemeteryEmojiTwo")
//
//
                 
                 
             }
    }
    
   
    
    
    


extension ViewController: UITextFieldDelegate{
    
    @IBAction func playerOneName(_ sender: UITextField) {
        
        print (playerTwoNameText.text!)
        
        
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
