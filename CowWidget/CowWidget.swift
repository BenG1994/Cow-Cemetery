//
//  CowWidget.swift
//  CowWidget
//
//  Created by Ben Gauger on 2/5/23.
//

import WidgetKit
import SwiftUI

let userDefaultsTwo = UserDefaults(suiteName: "group.CowCemetery")

let playerOneName = userDefaultsTwo?.value(forKey: "PlayerOneName") ?? "Player 1"
let playerTwoName = userDefaultsTwo?.value(forKey: "PlayerTwoName") ?? "Player 2"

let playerOneCows = userDefaultsTwo?.value(forKey: K.totalCowsOneWidget)

let playerTwoCows = userDefaultsTwo?.value(forKey: K.totalCowsTwoWidget)

let playerOneCemeteries = userDefaultsTwo?.value(forKey: K.cemeteryOneText)

let playerTwoCemeteries = userDefaultsTwo?.value(forKey: K.cemeteryTwoText)


struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), playerOneName: "", playerTwoName: "", playerOneCows: 0, playerTwoCows: 0, playerOneCemeteries: 0, playerTwoCemeteries: 0)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), playerOneName: playerOneName as! String, playerTwoName: playerTwoName as! String, playerOneCows: playerOneCows as! Int, playerTwoCows: playerTwoCows as! Int, playerOneCemeteries: playerOneCemeteries as! Int, playerTwoCemeteries: playerTwoCemeteries as! Int)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        let userDefaults = UserDefaults(suiteName: "group.CowCemetery")

        let playerOneName = userDefaults?.value(forKey: "PlayerOneName") ?? "Player 1"
        let playerTwoName = userDefaults?.value(forKey: "PlayerTwoName") ?? "Player 2"

        let playerOneCows = userDefaults?.value(forKey: K.totalCowsOneWidget)

        let playerTwoCows = userDefaults?.value(forKey: K.totalCowsTwoWidget)

        let playerOneCemeteries = userDefaults?.value(forKey: K.cemeteryOneText)

        let playerTwoCemeteries = userDefaults?.value(forKey: K.cemeteryTwoText)
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, playerOneName: playerOneName as! String, playerTwoName: playerTwoName as! String, playerOneCows: playerOneCows as! Int, playerTwoCows: playerTwoCows as! Int, playerOneCemeteries: playerOneCemeteries as! Int, playerTwoCemeteries: playerTwoCemeteries as! Int)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let playerOneName: String
    let playerTwoName: String
    let playerOneCows: Int
    let playerTwoCows: Int
    
    let playerOneCemeteries: Int
    let playerTwoCemeteries: Int
}

struct CowWidgetEntryView : View {
    var entry: Provider.Entry
    
    
    var body: some View {
        ZStack
            {
            Image("6a68c9aee6a3655 dark")
                .resizable()
                .aspectRatio(contentMode: .fill)
            VStack{
                Text(entry.playerOneName)
                    .bold()
                    .underline()
                    .padding(2)
                HStack{
                    Text("🐄: \(entry.playerOneCows)")
                    Text("🪦: \(entry.playerOneCemeteries)")
                }
                
                Text(entry.playerTwoName)
                    .bold()
                    .underline()
                    .padding(2)
                HStack{
                    Text("🐄: \(entry.playerTwoCows)")
                    Text("🪦: \(entry.playerTwoCemeteries)")
                }
            }
        }
        
    }
}

struct CowWidget: Widget {
    let kind: String = "CowWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CowWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Cow Cemetery")
        .description("See a real time count of your cows and cemeteries.")
        .supportedFamilies([.systemSmall,
            .accessoryCircular,
            .accessoryRectangular])
    }
}

struct CowWidget_Previews: PreviewProvider {
    static var previews: some View {
        CowWidgetEntryView(entry: SimpleEntry(date: Date(), playerOneName: "Player 1", playerTwoName: "Player 2", playerOneCows: 1234, playerTwoCows: 543, playerOneCemeteries: 2, playerTwoCemeteries: 14))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
