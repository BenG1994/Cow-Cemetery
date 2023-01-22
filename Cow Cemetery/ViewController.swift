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
    
    var addCowsAmount = ""
    
    
    var cemeteryEmojis: [String] = []
    var cemeteryEmojisTwo: [String] = []
    //    var cemeteryEmoji: [String] = UserDefaults.standard.object(forKey: "CemeteryEmoji")! as? [String] ?? []
    //    var cemeteryEmoji: [String] = UserDefaults.standard.stringArray(forKey: "CemeteryEmoji") ?? []
    
    
    var cemeteryEmojiTwo: [String] = []
    
    var cowEmojis: [String] = []
    var cowEmojisTwo: [String] = []
    var totalCowsOne = UserDefaults.standard.integer(forKey: "TotalCows")
    var totalCowsTwo = UserDefaults.standard.integer(forKey: "TotalCowsTwo")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerOneNameText.delegate = self
        playerTwoNameText.delegate = self
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "cow background dark.png")!)
        
        
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
        
        //chance PlayerOneCow key for either less than nine or more than. I think they compete when saving user defaults then when adding...
        
        
        if userDefaults.string(forKey: "PlayerOneCowsText") != nil{
            print("\(userDefaults.string(forKey: "PlayerOneCowsText")!)")
            playerOneCows.text = "\(userDefaults.string(forKey: "PlayerOneCowsText")!)"
        }else if userDefaults.array(forKey: "PlayerOneCows") as? [String] != nil{
            if let cowDisplayEmojis = userDefaults.array(forKey: "PlayerOneCows") as? [String] {
                playerOneCows.text = "\(cowDisplayEmojis.joined())"
                cowEmojis = cowDisplayEmojis
                print(cowEmojis)
            }
        }else {
            playerOneCows.text = ""
        }
        
        if userDefaults.string(forKey: "PlayerTwoCowsText") != nil{
            print("\(userDefaults.string(forKey: "PlayerTwoCowsText")!)")
            playerTwoCows.text = "\(userDefaults.string(forKey: "PlayerTwoCowsText")!)"
        }else if userDefaults.array(forKey: "PlayerTwoCows") as? [String] != nil{
            if let cowDisplayEmojisTwo = userDefaults.array(forKey: "PlayerTwoCows") as? [String] {
                playerTwoCows.text = "\(cowDisplayEmojisTwo.joined())"
                cowEmojisTwo = cowDisplayEmojisTwo
                print(cowEmojisTwo)
            }
        }else {
            playerTwoCows.text = ""
        }
        
        
        
        //        if let cowDisplayEmojis = userDefaults.array(forKey: "PlayerOneCows") as? [String] {
        //            playerOneCows.text = "\(cowDisplayEmojis.joined())"
        //            cowEmojis = cowDisplayEmojis
        //            print(cowEmojis)
        //        } else {
        //            playerOneCows.text = ""
        //        }
        
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
    
    
    
    @IBAction func donePressed(_ segue: UIStoryboardSegue) {
    }
    
    
    
    
    
    @IBAction func playerOneSawCows(_ sender: UIButton) {
        
        
        
        
        var textField = UITextField()
        
//        textField.delegate = self
//
//
//
////
//        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//            if textField.text != nil{
//                return true
//            }else {
//                textField.text = "0"
//                return true
//            }
//        }
        
        
        
        
        
        let alert = UIAlertController(title: "Cows Spotted!", message: "How many cows did you see?", preferredStyle: .alert)
        
        let actionCancel = UIAlertAction(title: "False Alarm", style: .cancel)
        
        let action = UIAlertAction(title: "Add Cows", style: .default) {(action) in
            
            
            
            //MARK: - first cows
            
            var totalCows = self.totalCowsOne
            var additionalCows = 0
            
            let newCows = textField.text ?? "0"
            let cowsNumber = Int(newCows)
            
            var cowArrayOne: [String] = []
            
            if self.numberOfCowsPlayerOne.text == "0 cows"{
                self.userDefaults.set(cowsNumber, forKey: "FirstCows")
                let firstCows = UserDefaults.standard.integer(forKey: "FirstCows")
                print(firstCows)
                totalCows += firstCows
                self.userDefaults.set(totalCows, forKey: "TotalCows")
                print(totalCows)
                
                self.numberOfCowsPlayerOne.text = "\(self.userDefaults.string(forKey: "FirstCows")!) cows"
                
                self.addCowEmojiOne()
                self.userDefaults.set(cowArrayOne, forKey: "PlayerOneCows")
                print(cowArrayOne.joined())
            }else if self.numberOfCowsPlayerOne.text != "# of Cows"{
                additionalCows = cowsNumber ?? 0
                print(additionalCows)
                totalCows = UserDefaults.standard.integer(forKey: "TotalCows")
                totalCows += additionalCows
                print(totalCows)
                self.userDefaults.set(totalCows, forKey: "TotalCows")
                print(totalCows)
                self.numberOfCowsPlayerOne.text = "\(self.userDefaults.string(forKey: "TotalCows")!) cows"
                //                print("\(UserDefaults.standard.object(forKey: "CemeteryEmoji")!) after userDefaults stuff")
                self.addCowEmojiOne()
                self.userDefaults.set(cowArrayOne, forKey: "PlayerOneCows")
                //                    print("\(self.userDefaults.string(forKey: "PlayerOneCowsText")!) player one text")
                print(cowArrayOne.joined())
            }
            
           
            
        }
        
        alert.addTextField { (alertTextField) in
//            textField.delegate = self
            
            alertTextField.placeholder = ""
//            alertTextField.text = "0"
            textField = alertTextField
            textField.keyboardType = UIKeyboardType.numberPad
            
            
        }
        
        alert.addAction(action)
        alert.addAction(actionCancel)
        
        
        
        
        present (alert, animated: true, completion: nil)
        
        
        
    }
    
    func addCowEmojiOne() {
        
        //            print(UserDefaults.standard.integer(forKey: "TotalCowsTwo"))
        //            let totalCows = self.totalCowsTwo
        let totalCows = UserDefaults.standard.integer(forKey: "TotalCows")
        //
        
        //        if UserDefaults.standard.integer(forKey: "TotalCowsTwo") 1...9 {
        //            print("\(totalCows) before switch")
        
        cowsBetweenZeroAndNine()
        
        userDefaults.set(self.playerOneCows.text, forKey: "PlayerOneCowsText")
        
        print(userDefaults.string(forKey: "PlayerOneCowsText")!)
        
        //        smallCowSwitchOne()
        
        //        switch UserDefaults.standard.integer(forKey: "TotalCows"){
        //        case 0:
        //            return zeroCowsP1()
        //        case 1:
        //            return self.playerOneCows.text = "🐮"
        //        case 2:
        //            return self.playerOneCows.text = "🐮🐮"
        //        case 3:
        //            return self.playerOneCows.text = "🐮🐮🐮"
        //        case 4:
        //            return self.playerOneCows.text = "🐮🐮🐮🐮"
        //        case 5:
        //            return self.playerOneCows.text = "🐮🐮🐮🐮🐮"
        //        case 6:
        //            return self.playerOneCows.text = "🐮🐮🐮🐮🐮🐮"
        //        case 7:
        //            return self.playerOneCows.text = "🐮🐮🐮🐮🐮🐮🐮"
        //        case 8:
        //            return self.playerOneCows.text = "🐮🐮🐮🐮🐮🐮🐮🐮"
        //        case 9:
        //            return self.playerOneCows.text = "🐮🐮🐮🐮🐮🐮🐮🐮🐮"
        //        case 10...:
        //            return cowsAboveNineP1()
        //        default:
        //            return zeroCowsP1()
        //
        //
        //        }
        
        
        
    }
    
    func cowsBetweenZeroAndNine() {
        
        switch UserDefaults.standard.integer(forKey: "TotalCows"){
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
        let totalCows = UserDefaults.standard.integer(forKey: "TotalCows")
        let totalCowsDivided = totalCows / 10
        let cowDivide = 1
        var cowArrayOne: [String] = []
        let cow = "🐄"
        print("\(totalCowsDivided) from else if cows")
        print("\(cow) from else if cows")
        for cowDivide in 1...totalCowsDivided {
            print(cow)
            cowArrayOne.append(cow)
            print(cowArrayOne.joined())
            self.playerOneCows.text = cowArrayOne.joined()
            self.userDefaults.set(cowArrayOne, forKey: "PlayerOneCows")
            print("\(userDefaults.array(forKey: "PlayerOneCows")!) cow array one cows")
        }
    }
    
    //    func cowsBetweenZeroAndNine() {
    //        self.userDefaults.set(totalCowsOne, forKey: "PlayerOneCows")
    //        print(totalCowsOne)
    //    }
    
    func zeroCowsP1() {
        userDefaults.set(0, forKey: "TotalCows")
        userDefaults.set(0, forKey: "FirstCows")
        self.playerOneCows.text = ""
        print(UserDefaults.standard.integer(forKey: "TotalCows"))
    }
    
    
    
    @IBAction func playerOneCemetery(_ sender: UIButton) {
        
        let cemeteryCows = UserDefaults.standard.integer(forKey: "TotalCows") / 2
        self.userDefaults.set(cemeteryCows, forKey: "TotalCows")
        print("\(cemeteryCows) start off cemetery func")
        self.numberOfCowsPlayerOne.text = "\(self.userDefaults.string(forKey: "TotalCows")!) cows"
        
        
        addCemeteryEmoji()
        addCowEmojiOne()
        
        print(UserDefaults.standard.object(forKey: "CemeteryEmoji")!)
        
        let alert = UIAlertController(title: "Cemetery!", message: "Your opponent spotted a cemetery on your side. Half your cows have died.", preferredStyle: .alert)
        present (alert, animated: true, completion: nil)
        let when = DispatchTime.now() + 2.5
        DispatchQueue.main.asyncAfter(deadline: when){
          // your code with delay
          alert.dismiss(animated: true, completion: nil)
        }
            
        
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
        
        let actionCancel = UIAlertAction(title: "False Alarm", style: .cancel)
        
        let action = UIAlertAction(title: "Add Cows", style: .default) {(action) in
            
            //MARK: - first cows
            
            var totalCows = self.totalCowsTwo
            var additionalCows = 0
            let newCows = textField.text ?? "0"
            let cowsNumber = Int(newCows)
            
            if self.numberOfCowsPlayerTwo.text == "0 cows"{
                self.userDefaults.set(cowsNumber, forKey: "FirstCowsTwo")
                let firstCows = UserDefaults.standard.integer(forKey: "FirstCowsTwo")
                print("\(firstCows) first cows spotted")
                print("\(totalCows) might be the problem")
                totalCows += firstCows
                self.userDefaults.set(totalCows, forKey: "TotalCowsTwo")
                print("\(totalCows) first cows user default set")
                //                let totalCows = firstCows
                //                self.userDefaults.set(0, forKey: "FirstAddition")
                //                self.userDefaults.set(0, forKey: "SecondCows")
                //                print(totalCows)
                self.numberOfCowsPlayerTwo.text = "\(self.userDefaults.string(forKey: "FirstCowsTwo")!) cows"
                self.addCowEmojiTwo()
            }else if self.numberOfCowsPlayerTwo.text != "# of Cows"{
                additionalCows = cowsNumber ?? 0
                print("\(additionalCows) additional cows")
                totalCows = UserDefaults.standard.integer(forKey: "TotalCowsTwo")
                totalCows += additionalCows
                print("\(totalCows) total cows after seeing more")
                self.userDefaults.set(totalCows, forKey: "TotalCowsTwo")
                print("\(totalCows) after user defaults set")
                self.numberOfCowsPlayerTwo.text = "\(self.userDefaults.string(forKey: "TotalCowsTwo")!) cows"
                
                self.addCowEmojiTwo()
                
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
        //            print(UserDefaults.standard.integer(forKey: "TotalCowsTwo"))
        //            let totalCows = self.totalCowsTwo
        let totalCows = UserDefaults.standard.integer(forKey: "TotalCowsTwo")
        //
        //
        
        //        if UserDefaults.standard.integer(forKey: "TotalCowsTwo") 1...9 {
        //            print("\(totalCows) before switch")
        
        cowsBetweenZeroAndNineTwo()
        
        userDefaults.set(self.playerTwoCows.text, forKey: "PlayerTwoCowsText")
        
        print(userDefaults.string(forKey: "PlayerTwoCowsText")!)
        
        //        if UserDefaults.standard.integer(forKey: "TotalCowsTwo") 1...9 {
        //            print("\(totalCows) before switch")
        //            switch UserDefaults.standard.integer(forKey: "TotalCowsTwo"){
        //            case 0:
        //                return zeroCowsP2()
        //            case 1:
        //                return self.playerTwoCows.text = "🐮"
        //            case 2:
        //                return self.playerTwoCows.text = "🐮🐮"
        //            case 3:
        //                return self.playerTwoCows.text = "🐮🐮🐮"
        //                //                                return print("\(totalCows) case 3")
        //            case 4:
        //                return self.playerTwoCows.text = "🐮🐮🐮🐮"
        //            case 5:
        //                return self.playerTwoCows.text = "🐮🐮🐮🐮🐮"
        //            case 6:
        //                return self.playerTwoCows.text = "🐮🐮🐮🐮🐮🐮"
        //            case 7:
        //                return self.playerTwoCows.text = "🐮🐮🐮🐮🐮🐮🐮"
        //            case 8:
        //                return self.playerTwoCows.text = "🐮🐮🐮🐮🐮🐮🐮🐮"
        //            case 9:
        //                return self.playerTwoCows.text = "🐮🐮🐮🐮🐮🐮🐮🐮🐮"
        //            case 10...:
        //                return cowsAboveNineP2()
        //            default:
        //                return zeroCowsP2()
        //
        //
        //            }
        
        
        //        }else if totalCows > 9{
        //            let totalCowsDivided = totalCows / 10
        //            let cowDivide = 1
        //            var cowArray: [String] = []
        //            let cow = "🐄"
        //            print("\(totalCowsDivided) from else if cows")
        //            print("\(cow) from else if cows")
        //            for cowDivide in 1...totalCowsDivided {
        //                print(cow)
        //                cowArray.append(cow)
        //                print(cowArray.joined())
        //                self.playerTwoCows.text = cowArray.joined()
        //                self.userDefaults.set(cowArray, forKey: "PlayerTwoCows")
        //            }
        //        }else if totalCows == 0{
        //            userDefaults.set(0, forKey: "TotalCowsTwo")
        //            print(UserDefaults.standard.integer(forKey: "TotalCowsTwo"))
        //        }
        //
        
    }
    
    func cowsBetweenZeroAndNineTwo() {
        
        switch UserDefaults.standard.integer(forKey: "TotalCowsTwo"){
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
        let totalCows = UserDefaults.standard.integer(forKey: "TotalCowsTwo")
        let totalCowsDivided = totalCows / 10
        let cowDivide = 1
        var cowArrayTwo: [String] = []
        let cow = "🐄"
        print("\(totalCowsDivided) from else if cows")
        print("\(cow) from else if cows")
        for cowDivide in 1...totalCowsDivided {
            print(cow)
            cowArrayTwo.append(cow)
            print(cowArrayTwo.joined())
            self.playerTwoCows.text = cowArrayTwo.joined()
            self.userDefaults.set(cowArrayTwo, forKey: "PlayerTwoCows")
            print("\(userDefaults.array(forKey: "PlayerTwoCows")!) cow array one cows")
        }
    }
    
    //    func cowsBetweenZeroAndNine() {
    //        self.userDefaults.set(totalCowsOne, forKey: "PlayerOneCows")
    //        print(totalCowsOne)
    //    }
    
    func zeroCowsP2() {
        userDefaults.set(0, forKey: "TotalCowsTwo")
        userDefaults.set(0, forKey: "FirstCowsTwo")
        self.playerTwoCows.text = ""
        print(UserDefaults.standard.integer(forKey: "TotalCowsTwo"))
    }
    
    
    //        func cowsAboveNine() {
    //            let totalCows = UserDefaults.standard.integer(forKey: "TotalCows")
    //            let totalCowsDivided = totalCows / 10
    //            let cowDivide = 1
    //            var cowArray: [String] = []
    //            let cow = "🐄"
    //            print("\(totalCowsDivided) from else if cows")
    //            print("\(cow) from else if cows")
    //            for cowDivide in 1...totalCowsDivided {
    //                print(cow)
    //                cowArray.append(cow)
    //                print(cowArray.joined())
    //                self.playerTwoCows.text = cowArray.joined()
    //                self.userDefaults.set(cowArray, forKey: "PlayerOneCows")
    //            }
    //        }
    //
    //        func zeroCows() {
    //            userDefaults.set(0, forKey: "TotalCows")
    //            userDefaults.set(0, forKey: "FirstCows")
    //            self.playerTwoCows.text = ""
    //            print(UserDefaults.standard.integer(forKey: "TotalCows"))
    //        }
    //
    //        func oneCow (){
    //
    //        }
    
    
    @IBAction func playerTwoCemetery(_ sender: UIButton) {
        
        let cemeteryCows = UserDefaults.standard.integer(forKey: "TotalCowsTwo") / 2
        self.userDefaults.set(cemeteryCows, forKey: "TotalCowsTwo")
        print("\(cemeteryCows) start off cemetery func")
        self.numberOfCowsPlayerTwo.text = "\(self.userDefaults.string(forKey: "TotalCowsTwo")!) cows"
        
        //        cemeteryEmojiTwo.append("🪦")
        addCemeteryEmojiTwo()
        addCowEmojiTwo()
        //        print(totalCemeteries!)
        
        let alert = UIAlertController(title: "Cemetery!", message: "Your opponent spotted a cemetery on your side. Half your cows have died.", preferredStyle: .alert)
        present (alert, animated: true, completion: nil)
        let when = DispatchTime.now() + 2.5
        DispatchQueue.main.asyncAfter(deadline: when){
          // your code with delay
          alert.dismiss(animated: true, completion: nil)
        }
        
        
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
    
    
    @IBAction func newGamePressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Congratulations", message: "You've reached the end of the game. Start a new one?", preferredStyle: .alert)
        
        let actionStart = UIAlertAction(title: "Start", style: .destructive) {(action) in
            
            
            self.userDefaults.set(0, forKey: "TotalCows")
            self.userDefaults.set(0, forKey: "TotalCowsTwo")
            self.userDefaults.set([], forKey: "CemeteryEmoji")
            self.userDefaults.set([], forKey: "CemeteryEmojiTwo")
            self.userDefaults.set(0, forKey: "FirstCows")
            self.userDefaults.set(0, forKey: "FirstCowsTwo")
            self.playerTwoCows.text = ""
            self.playerOneCows.text = ""
            self.numberOfCowsPlayerOne.text = "# of cows"
            self.numberOfCowsPlayerTwo.text = "# of cows"
            self.playerOneCemeteries.text = ""
            self.playerTwoCemeteries.text = ""
            
            
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(actionStart)
        alert.addAction(actionCancel)
        
        
        
        
        present (alert, animated: true, completion: nil)
        
    }
    
    @IBAction func readRulesPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "ReadRules", sender: self)
    }
    
    
}







extension ViewController: UITextFieldDelegate{
    
    @IBAction func playerOneName(_ sender: UITextField) {
        
        print (playerTwoNameText.text!)
        
        
    }
    
    @IBAction func playerTwoName(_ sender: UITextField) {
        print (playerTwoNameText.text!)
        
    }
    
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        if textField.text != nil{
//            return true
//        }else {
//            textField.placeholder = "Did you see cows?"
//            return false
//        }
//    }
    
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
        
//        if textField.text == "0"{
//            textField.text = ""
//        }else{
//            textField.text = "0"
//        }
    
        
    }
    
    
    
//    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        if textField.text == "0"{
//            return true
//        }else{
//            textField.text = "0"
//            return false
//        }
//    }
    
}
