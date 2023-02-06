//
//  Keys.swift
//  Cow Cemetery
//
//  Created by Ben Gauger on 1/19/23.
//

import Foundation

let userDefaults = UserDefaults(suiteName: "group.CowCemetery")

struct K {
    static let totalCowsOne = "TotalCows"
    static let totalCowsOneWidget = "TotalCowsWidget"
    static let totalCowsTwo = "TotalCowsTwo"
    static let totalCowsTwoWidget = "TotalCowsTwoWidget"
    static let cemeteryEmojiOne = "CemeteryEmoji"
    static let cemeteryEmojiTwo = "CemeteryEmojiTwo"
    static let playerOneCowText = "PlayerOneCowsText"
    static let playerTwoCowText = "PlayerTwoCowsText"
    static let firstCowsOne = "FirstCows"
    static let firstCowsTwo = "FirstCowsTwo"
    static let cowsOne = "PlayerOneCows"
    static let cowsTwo = "PlayerTwoCows"
    static let cemeteryOneText = "OneCemeteries"
    static let cemeteryTwoText = "TwoCemeteries"
}

struct WidgetK {
    let playerOneName = userDefaults?.value(forKey: "PlayerOneName")
    let playerTwoName = userDefaults?.value(forKey: "PlayerTwoName")
    let playerOneCows = userDefaults?.value(forKey: "TotalCows")
    let playerTwoCows = userDefaults?.value(forKey: "TotalCowsTwo")
}
