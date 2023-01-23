//
//  Cow Math.swift
//  Cow Cemetery
//
//  Created by Ben Gauger on 1/15/23.
//

import Foundation
import UIKit

let VC = ViewController()

let userDefaults = UserDefaults()

//let totalCows = UserDefaults.standard.integer(forKey: "TotalCows")
//
//func smallCowSwitchOne() {
//
//
//    switch UserDefaults.standard.integer(forKey: "TotalCows"){
//    case 0:
//        return VC.zeroCowsP1()
//    case 1:
//        return oneCow()
//    case 2:
//        return twoCows()
//    case 3:
//        return threeCows()
//    case 4:
//        return fourCows()
//    case 5:
//        return fiveCows()
//    case 6:
//        return sixCows()
//    case 7:
//        return sevenCows()
//    case 8:
//        return eightCows()
//    case 9:
//        return nineCows()
//    case 10...:
//        return VC.cowsAboveNineP1()
//    default:
//        return VC.zeroCowsP1()
//
//    }
//
//
//
//}
//
//func oneCow() {
//    VC.playerOneCows.text = "🐮"
//    userDefaults.set(totalCows, forKey: "PlayerOneCows")
//    print("\(userDefaults.string(forKey: "PlayerOneCows")) onecow function")
//
//}
//
//func twoCows() {
//    VC.playerOneCows.text = "🐮🐮"
//    userDefaults.set(totalCows, forKey: "PlayerOneCows")
//
//}
//
//func threeCows() {
//    VC.playerOneCows.text = "🐮🐮🐮"
//    userDefaults.set(totalCows, forKey: "PlayerOneCows")
//
//}
//
//func fourCows() {
//    VC.playerOneCows.text = "🐮🐮🐮🐮"
//    userDefaults.set(totalCows, forKey: "PlayerOneCows")
//
//}
//
//func fiveCows() {
//    VC.playerOneCows.text = "🐮🐮🐮🐮🐮"
//    userDefaults.set(totalCows, forKey: "PlayerOneCows")
//
//}
//
//func sixCows() {
//    VC.playerOneCows.text = "🐮🐮🐮🐮🐮🐮"
//    userDefaults.set(totalCows, forKey: "PlayerOneCows")
//
//}
//
//func sevenCows() {
//    VC.playerOneCows.text = "🐮🐮🐮🐮🐮🐮🐮"
//    userDefaults.set(totalCows, forKey: "PlayerOneCows")
//
//}
//
//func eightCows() {
//    VC.playerOneCows.text = "🐮🐮🐮🐮🐮🐮🐮🐮"
//    userDefaults.set(totalCows, forKey: "PlayerOneCows")
//
//}
//
//func nineCows() {
//    VC.playerOneCows.text = "🐮🐮🐮🐮🐮🐮🐮🐮🐮"
//    userDefaults.set(totalCows, forKey: "PlayerOneCows")
//
//}
//
//
////if let cowDisplayEmojis = userDefaults.array(forKey: "PlayerOneCows") as? [String] {
////    if cowDisplayEmojis == [] {
////        if userDefaults.string(forKey: "PlayerOneCows") != nil{
////            playerOneCows.text = "\(userDefaults.string(forKey: "PlayerOneCows")!)"
////        }else{
////            playerOneCows.text = ""
////        }
////    }else if cowDisplayEmojis != []{
////        playerOneCows.text = "\(cowDisplayEmojis.joined())"
////        cowEmojis = cowDisplayEmojis
////        print(cowEmojis)
////    } else {
////        playerOneCows.text = ""
////    }
