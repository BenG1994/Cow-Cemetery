////
////  ViewDidLoad.swift
////  Cow Cemetery
////
////  Created by Ben Gauger on 1/23/23.
////
//
//import Foundation
//import UIKit
//
//let VC = ViewController()
//
//let userDefaults = UserDefaults.standard
//
//var addCowsAmount = ""
//
//
//var cemeteryEmojis: [String] = []
//var cemeteryEmojisTwo: [String] = []
//
//
//var cemeteryEmojiTwo: [String] = []
//
//var cowEmojis: [String] = []
//var cowEmojisTwo: [String] = []
//var totalCowsOne = UserDefaults.standard.integer(forKey: "TotalCows")
//var totalCowsTwo = UserDefaults.standard.integer(forKey: "TotalCowsTwo")
//
//
//func runViewDidLoad() {
//    
//    if userDefaults.value(forKey: "TotalCows") != nil {
//        VC.numberOfCowsPlayerOne.text = "\(UserDefaults.standard.integer(forKey: "TotalCows")) cows"
//    }else {
//        VC.numberOfCowsPlayerOne.text = "0 Cows"
//    }
//    
//    if userDefaults.value(forKey: "TotalCowsTwo") != nil {
//        VC.numberOfCowsPlayerTwo.text = "\(UserDefaults.standard.integer(forKey: "TotalCowsTwo")) cows"
//    }else {
//        VC.numberOfCowsPlayerTwo.text = "0 Cows"
//    }
//    
//    
//    if let emojis = userDefaults.array(forKey: "CemeteryEmoji") as? [String] {
//        VC.playerOneCemeteries.text = "\(emojis.joined())"
//        cemeteryEmojis = emojis
//        print(cemeteryEmojis)
//    } else {
//        VC.playerOneCemeteries.text = ""
//    }
//    
//    if let emojisTwo = userDefaults.array(forKey: "CemeteryEmojiTwo") as? [String] {
//        VC.playerTwoCemeteries.text = "\(emojisTwo.joined())"
//        cemeteryEmojisTwo = emojisTwo
//        print(cemeteryEmojisTwo)
//    } else {
//        VC.playerTwoCemeteries.text = ""
//    }
//    
//    
//    if userDefaults.string(forKey: "PlayerOneCowsText") != nil{
//        print("\(userDefaults.string(forKey: "PlayerOneCowsText")!)")
//        VC.playerOneCows.text = "\(userDefaults.string(forKey: "PlayerOneCowsText")!)"
//    }else if userDefaults.array(forKey: "PlayerOneCows") as? [String] != nil{
//        if let cowDisplayEmojis = userDefaults.array(forKey: "PlayerOneCows") as? [String] {
//            VC.playerOneCows.text = "\(cowDisplayEmojis.joined())"
//            cowEmojis = cowDisplayEmojis
//            print(cowEmojis)
//        }
//    }else {
//        VC.playerOneCows.text = ""
//    }
//    
//    if userDefaults.string(forKey: "PlayerTwoCowsText") != nil{
//        print("\(userDefaults.string(forKey: "PlayerTwoCowsText")!)")
//        VC.playerTwoCows.text = "\(userDefaults.string(forKey: "PlayerTwoCowsText")!)"
//    }else if userDefaults.array(forKey: "PlayerTwoCows") as? [String] != nil{
//        if let cowDisplayEmojisTwo = userDefaults.array(forKey: "PlayerTwoCows") as? [String] {
//            VC.playerTwoCows.text = "\(cowDisplayEmojisTwo.joined())"
//            cowEmojisTwo = cowDisplayEmojisTwo
//            print(cowEmojisTwo)
//        }
//    }else {
//        VC.playerTwoCows.text = ""
//    }
//    
//    
//}
