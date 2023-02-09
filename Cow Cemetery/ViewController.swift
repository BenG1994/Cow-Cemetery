//
//  ViewController.swift
//  Cow Cemetery
//
//  Created by Ben Gauger on 1/13/23.
//

import UIKit
import WidgetKit

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
    let textUserDefaults = UserDefaults(suiteName: "group.CowCemetery")!
        
    var cemeteryEmojis: [String] = []
    var cemeteryEmojisTwo: [String] = []
    var cowEmojis: [String] = []
    var cowEmojisTwo: [String] = []
    var totalCowsOne = UserDefaults.standard.integer(forKey: K.totalCowsOne)
    var totalCowsTwo = UserDefaults.standard.integer(forKey: K.totalCowsTwo)
    
    //MARK: - Loading User Defaults
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerOneNameText.delegate = self
        playerTwoNameText.delegate = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "cow background dark.png")!)
        playerOneNameText.text = textUserDefaults.value(forKey: "PlayerOneName") as? String ?? "Player 1"
        playerTwoNameText.text = textUserDefaults.value(forKey: "PlayerTwoName") as? String ?? "Player 2"

        if userDefaults.value(forKey: K.totalCowsOne) != nil {
            numberOfCowsPlayerOne.text = "\(UserDefaults.standard.integer(forKey: K.totalCowsOne)) cows"
        }else {
            numberOfCowsPlayerOne.text = "0 Cows"
        }

        if userDefaults.value(forKey: K.totalCowsTwo) != nil {
            numberOfCowsPlayerTwo.text = "\(UserDefaults.standard.integer(forKey: K.totalCowsTwo)) cows"
        }else {
            numberOfCowsPlayerTwo.text = "0 Cows"
        }
        
        if let emojis = userDefaults.array(forKey: K.cemeteryEmojiOne) as? [String] {
            playerOneCemeteries.text = "\(emojis.joined())"
            cemeteryEmojis = emojis
            print(cemeteryEmojis)
        } else {
            playerOneCemeteries.text = ""
        }

        if let emojisTwo = userDefaults.array(forKey: K.cemeteryEmojiTwo) as? [String] {
            playerTwoCemeteries.text = "\(emojisTwo.joined())"
            cemeteryEmojisTwo = emojisTwo
            print(cemeteryEmojisTwo)
        } else {
            playerTwoCemeteries.text = ""
        }

        if userDefaults.string(forKey: K.playerOneCowText) != nil{
            print("\(userDefaults.string(forKey: K.playerOneCowText)!)")
            playerOneCows.text = "\(userDefaults.string(forKey: K.playerOneCowText)!)"
        }else if userDefaults.array(forKey: K.cowsOne) as? [String] != nil{
            if let cowDisplayEmojis = userDefaults.array(forKey: K.cowsOne) as? [String] {
                playerOneCows.text = "\(cowDisplayEmojis.joined())"
                cowEmojis = cowDisplayEmojis
                print(cowEmojis)
            }
        }else {
            playerOneCows.text = ""
        }

        if userDefaults.string(forKey: K.playerTwoCowText) != nil{
            print("\(userDefaults.string(forKey: K.playerTwoCowText)!)")
            playerTwoCows.text = "\(userDefaults.string(forKey: K.playerTwoCowText)!)"
        }else if userDefaults.array(forKey: K.cowsTwo) as? [String] != nil{
            if let cowDisplayEmojisTwo = userDefaults.array(forKey: K.cowsTwo) as? [String] {
                playerTwoCows.text = "\(cowDisplayEmojisTwo.joined())"
                cowEmojisTwo = cowDisplayEmojisTwo
                print(cowEmojisTwo)
            }
        }else {
            playerTwoCows.text = ""
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

    @IBAction func donePressed(_ segue: UIStoryboardSegue) {
    }
    
    //MARK: - Player One Cows
    
    @IBAction func playerOneSawCows(_ sender: UIButton) {
    
        var textField = UITextField()
    
        let alert = UIAlertController(title: "Cows Spotted!", message: "How many cows did you see?", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "False Alarm", style: .cancel)
        let action = UIAlertAction(title: "Add Cows", style: .default) {(action) in
            
            var totalCows = self.totalCowsOne
            var additionalCows = 0
            let newCows = textField.text ?? "0"
            let cowsNumber = Int(newCows)
            let cowArrayOne: [String] = []
            
            if self.numberOfCowsPlayerOne.text == "0 cows"{
                self.userDefaults.set(cowsNumber, forKey: K.firstCowsOne)
                let firstCows = UserDefaults.standard.integer(forKey: K.firstCowsOne)
                print(firstCows)
                totalCows += firstCows
                self.userDefaults.set(totalCows, forKey: K.totalCowsOne)
                self.textUserDefaults.set(totalCows, forKey: K.totalCowsOneWidget)
                print(totalCows)
                self.numberOfCowsPlayerOne.text = "\(self.userDefaults.string(forKey: K.firstCowsOne)!) cows"
                self.addCowEmojiOne()
                self.userDefaults.set(cowArrayOne, forKey: K.cowsOne)
                print(cowArrayOne.joined())
                WidgetCenter.shared.reloadAllTimelines()
            }else if self.numberOfCowsPlayerOne.text != "# of Cows"{
                additionalCows = cowsNumber ?? 0
                print(additionalCows)
                totalCows = UserDefaults.standard.integer(forKey: K.totalCowsOne)
                totalCows += additionalCows
                print(totalCows)
                self.userDefaults.set(totalCows, forKey: K.totalCowsOne)
                self.textUserDefaults.set(totalCows, forKey: K.totalCowsOneWidget)
                print(totalCows)
                self.numberOfCowsPlayerOne.text = "\(self.userDefaults.string(forKey: K.totalCowsOne)!) cows"
                self.addCowEmojiOne()
                self.userDefaults.set(cowArrayOne, forKey: K.cowsOne)
                print(cowArrayOne.joined())
                WidgetCenter.shared.reloadAllTimelines()
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = ""
            textField = alertTextField
            textField.keyboardType = UIKeyboardType.numberPad
        }
        
        alert.addAction(action)
        alert.addAction(actionCancel)

        present (alert, animated: true, completion: nil)
        
    }
    
    func addCowEmojiOne() {
        
        _ = UserDefaults.standard.integer(forKey: K.totalCowsOne)
        cowsBetweenZeroAndNine()
        userDefaults.set(self.playerOneCows.text, forKey: K.playerOneCowText)
        print(userDefaults.string(forKey: K.playerOneCowText)!)
    }
    
    func cowsBetweenZeroAndNine() {
        
        switch UserDefaults.standard.integer(forKey: K.totalCowsOne){
        case 0:
            return zeroCowsP1()
        case 1:
            return self.playerOneCows.text = "🐮"
        case 2:
            return self.playerOneCows.text = "🐮🐮"
        case 3:
            return self.playerOneCows.text = "🐮🐮🐮"
        case 4:
            return self.playerOneCows.text = "🐮🐮🐮🐮"
        case 5:
            return self.playerOneCows.text = "🐮🐮🐮🐮🐮"
        case 6:
            return self.playerOneCows.text = "🐮🐮🐮🐮🐮🐮"
        case 7:
            return self.playerOneCows.text = "🐮🐮🐮🐮🐮🐮🐮"
        case 8:
            return self.playerOneCows.text = "🐮🐮🐮🐮🐮🐮🐮🐮"
        case 9:
            return self.playerOneCows.text = "🐮🐮🐮🐮🐮🐮🐮🐮🐮"
        case 10...:
            return cowsAboveNineP1()
        default:
            return zeroCowsP1()
        }
    }
    
    func cowsAboveNineP1() {
        let totalCows = UserDefaults.standard.integer(forKey: K.totalCowsOne)
        let totalCowsDivided = totalCows / 10
        var cowArrayOne: [String] = []
        let cow = "🐄"
        print("\(totalCowsDivided) from else if cows")
        print("\(cow) from else if cows")
        for _ in 1...totalCowsDivided {
            print(cow)
            cowArrayOne.append(cow)
            print(cowArrayOne.joined())
            self.playerOneCows.text = cowArrayOne.joined()
            self.userDefaults.set(cowArrayOne, forKey: K.cowsOne)
            print("\(userDefaults.array(forKey: K.cowsOne)!) cow array one cows")
        }
    }
    
    func zeroCowsP1() {
        userDefaults.set(0, forKey: K.totalCowsOne)
        userDefaults.set(0, forKey: K.firstCowsOne)
        self.playerOneCows.text = ""
        print(UserDefaults.standard.integer(forKey: K.totalCowsOne))
    }
    
    @IBAction func playerOneCemetery(_ sender: UIButton) {
        
        let totalCows = UserDefaults.standard.integer(forKey: K.totalCowsOne) / 2
        self.userDefaults.set(totalCows, forKey: K.totalCowsOne)
        self.textUserDefaults.set(totalCows, forKey: K.totalCowsOneWidget)
        print("\(totalCows) start off cemetery func")
        self.numberOfCowsPlayerOne.text = "\(self.userDefaults.string(forKey: K.totalCowsOne)!) cows"
        
        addCemeteryEmoji()
        addCowEmojiOne()

        print(UserDefaults.standard.object(forKey: K.cemeteryEmojiOne)!)
        
        let alert = UIAlertController(title: "Cemetery!", message: "Your opponent spotted a cemetery on your side. Half your cows have died.", preferredStyle: .alert)
        present (alert, animated: true, completion: nil)
        let when = DispatchTime.now() + 2.5
        DispatchQueue.main.asyncAfter(deadline: when){
          // your code with delay
          alert.dismiss(animated: true, completion: nil)
        }
        WidgetCenter.shared.reloadAllTimelines()
            
        func addCemeteryEmoji() {
            cemeteryEmojis.append("🪦")
            print(cemeteryEmojis)
            self.playerOneCemeteries.text = "\(cemeteryEmojis.joined())"
            self.textUserDefaults.set(cemeteryEmojis.count, forKey: K.cemeteryOneText)
            userDefaults.set(cemeteryEmojis, forKey: K.cemeteryEmojiOne)
        }
    }
    
    //MARK: - Player Two Cows
    
    @IBAction func playerTwoSawCows(_ sender: UIButton) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Cows Spotted!", message: "How many cows did you see?", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "False Alarm", style: .cancel)
        let action = UIAlertAction(title: "Add Cows", style: .default) {(action) in
            
            var totalCows = self.totalCowsTwo
            var additionalCows = 0
            let newCows = textField.text ?? "0"
            let cowsNumber = Int(newCows)
            
            if self.numberOfCowsPlayerTwo.text == "0 cows"{
                self.userDefaults.set(cowsNumber, forKey: K.firstCowsTwo)
                let firstCows = UserDefaults.standard.integer(forKey: K.firstCowsTwo)
                print("\(firstCows) first cows spotted")
                print("\(totalCows) might be the problem")
                totalCows += firstCows
                self.userDefaults.set(totalCows, forKey: K.totalCowsTwo)
                self.textUserDefaults.set(totalCows, forKey: K.totalCowsTwoWidget)
                print("\(totalCows) first cows user default set")
                self.numberOfCowsPlayerTwo.text = "\(self.userDefaults.string(forKey: K.firstCowsTwo)!) cows"
                self.addCowEmojiTwo()
            }else if self.numberOfCowsPlayerTwo.text != "# of Cows"{
                additionalCows = cowsNumber ?? 0
                print("\(additionalCows) additional cows")
                totalCows = UserDefaults.standard.integer(forKey: K.totalCowsTwo)
                totalCows += additionalCows
                print("\(totalCows) total cows after seeing more")
                self.userDefaults.set(totalCows, forKey: K.totalCowsTwo)
                self.textUserDefaults.set(totalCows, forKey: K.totalCowsTwoWidget)
                print("\(totalCows) after user defaults set")
                self.numberOfCowsPlayerTwo.text = "\(self.userDefaults.string(forKey: K.totalCowsTwo)!) cows"
                self.addCowEmojiTwo()
                WidgetCenter.shared.reloadAllTimelines()
            }
        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = ""
            textField = alertTextField
            textField.keyboardType = UIKeyboardType.numberPad
        }
        
        alert.addAction(action)
        alert.addAction(actionCancel)
        
        present (alert, animated: true, completion: nil)
    }
    
    func addCowEmojiTwo() {

        _ = UserDefaults.standard.integer(forKey: K.totalCowsTwo)
        cowsBetweenZeroAndNineTwo()
        userDefaults.set(self.playerTwoCows.text, forKey: K.playerTwoCowText)
        print(userDefaults.string(forKey: K.playerTwoCowText)!)
    }
    
    func cowsBetweenZeroAndNineTwo() {
        
        switch UserDefaults.standard.integer(forKey: K.totalCowsTwo){
        case 0:
            return zeroCowsP2()
        case 1:
            return self.playerTwoCows.text = "🐮"
        case 2:
            return self.playerTwoCows.text = "🐮🐮"
        case 3:
            return self.playerTwoCows.text = "🐮🐮🐮"
        case 4:
            return self.playerTwoCows.text = "🐮🐮🐮🐮"
        case 5:
            return self.playerTwoCows.text = "🐮🐮🐮🐮🐮"
        case 6:
            return self.playerTwoCows.text = "🐮🐮🐮🐮🐮🐮"
        case 7:
            return self.playerTwoCows.text = "🐮🐮🐮🐮🐮🐮🐮"
        case 8:
            return self.playerTwoCows.text = "🐮🐮🐮🐮🐮🐮🐮🐮"
        case 9:
            return self.playerTwoCows.text = "🐮🐮🐮🐮🐮🐮🐮🐮🐮"
        case 10...:
            return cowsAboveNineP2()
        default:
            return zeroCowsP2()
        }
    }
    
    func cowsAboveNineP2() {
        let totalCows = UserDefaults.standard.integer(forKey: K.totalCowsTwo)
        let totalCowsDivided = totalCows / 10
        var cowArrayTwo: [String] = []
        let cow = "🐄"
        print("\(totalCowsDivided) from else if cows")
        print("\(cow) from else if cows")
        for _ in 1...totalCowsDivided {
            print(cow)
            cowArrayTwo.append(cow)
            print(cowArrayTwo.joined())
            self.playerTwoCows.text = cowArrayTwo.joined()
            self.userDefaults.set(cowArrayTwo, forKey: K.cowsTwo)
            print("\(userDefaults.array(forKey: K.cowsTwo)!) cow array one cows")
        }
    }

    func zeroCowsP2() {
        userDefaults.set(0, forKey: K.totalCowsTwo)
        userDefaults.set(0, forKey: K.firstCowsTwo)
        self.playerTwoCows.text = ""
        print(UserDefaults.standard.integer(forKey: K.totalCowsTwo))
    }
    
    @IBAction func playerTwoCemetery(_ sender: UIButton) {
        
        let totalCows = UserDefaults.standard.integer(forKey: K.totalCowsTwo) / 2
        self.userDefaults.set(totalCows, forKey: K.totalCowsTwo)
        self.textUserDefaults.set(totalCows, forKey: K.totalCowsTwoWidget)
        print("\(totalCows) start off cemetery func")
        self.numberOfCowsPlayerTwo.text = "\(self.userDefaults.string(forKey: K.totalCowsTwo)!) cows"
    
        addCemeteryEmojiTwo()
        addCowEmojiTwo()

        let alert = UIAlertController(title: "Cemetery!", message: "Your opponent spotted a cemetery on your side. Half your cows have died.", preferredStyle: .alert)
        present (alert, animated: true, completion: nil)
        let when = DispatchTime.now() + 2.5
        DispatchQueue.main.asyncAfter(deadline: when){
          alert.dismiss(animated: true, completion: nil)
        }
        WidgetCenter.shared.reloadAllTimelines()
        
        func addCemeteryEmojiTwo() {
            cemeteryEmojisTwo.append("🪦")
            print(cemeteryEmojisTwo)
            self.playerTwoCemeteries.text = "\(cemeteryEmojisTwo.joined())"
            self.textUserDefaults.set(cemeteryEmojisTwo.count, forKey: "TwoCemeteries")
            userDefaults.set(cemeteryEmojisTwo, forKey: K.cemeteryEmojiTwo)
            
        }
    }
    
    func removeCemeteries() {
        cemeteryEmojis.removeAll()
        cemeteryEmojisTwo.removeAll()
    }
    
    //MARK: - New Game
    
    @IBAction func newGamePressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Congratulations", message: "You've reached the end of the game. Start a new one?", preferredStyle: .alert)
        let actionStart = UIAlertAction(title: "Start", style: .destructive) {(action) in
            
            self.userDefaults.set(0, forKey: K.totalCowsOne)
            self.textUserDefaults.set(0, forKey: K.totalCowsOneWidget)
            self.userDefaults.set(0, forKey: K.totalCowsTwo)
            self.textUserDefaults.set(0, forKey: K.totalCowsTwoWidget)
            self.textUserDefaults.set(0, forKey: K.cemeteryOneText)
            self.textUserDefaults.set(0, forKey: K.cemeteryTwoText)
            self.removeCemeteries()
            self.userDefaults.setValue([], forKey: K.cemeteryEmojiOne)
            self.userDefaults.setValue([], forKey: K.cemeteryEmojiTwo)
            
            print ("\(self.userDefaults.array(forKey: K.cemeteryEmojiOne))after new game pressed")
            print ("\(self.userDefaults.array(forKey: K.cemeteryEmojiTwo))after new game pressed")
         
            self.userDefaults.set(0, forKey: K.firstCowsOne)
            self.userDefaults.set(0, forKey: K.firstCowsTwo)
            self.userDefaults.set("", forKey: K.playerOneCowText)
            self.userDefaults.set("", forKey: K.playerTwoCowText)
            self.playerTwoCows.text = ""
            self.playerOneCows.text = ""
            self.numberOfCowsPlayerOne.text = "# of cows"
            self.numberOfCowsPlayerTwo.text = "# of cows"
            self.playerOneCemeteries.text = ""
            self.playerTwoCemeteries.text = ""
            WidgetCenter.shared.reloadAllTimelines()
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(actionStart)
        alert.addAction(actionCancel)

        present (alert, animated: true, completion: nil)
    }
    
    //MARK: - Read Rules
    
    @IBAction func readRulesPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ReadRules", sender: self)
    }
}

//MARK: - Text Field Delegate Methods

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
        textUserDefaults.set(newPlayerOneName, forKey: "PlayerOneName")
        print(textUserDefaults.value(forKey: "PlayerOneName")!)
        
        let newPlayerTwoName = playerTwoNameText.text
        print (newPlayerTwoName!)
        textUserDefaults.set(newPlayerTwoName, forKey: "PlayerTwoName")
        print(textUserDefaults.value(forKey: "PlayerTwoName")!)
        WidgetCenter.shared.reloadAllTimelines()
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

