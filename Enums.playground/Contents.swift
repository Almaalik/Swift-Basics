import UIKit

//MARK: - Enum -- Group of related values

//An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.

enum CompassPoint {
    case north
    case south
    case east
    case west
}

var directionToHead = CompassPoint.west

directionToHead = .east


var day = "Monday"
day = "Tuesday"
day = "August"  //Wrong declaration

//Simple enum

enum StudentsDetails {
    case rollNumber
    case rank
    case grande
}

func studentReport(detail: StudentsDetails) {
    switch detail {
    case .rollNumber:
        print("Roll Number:00123")
    case .rank:
        print("Rank: 2")
    case .grande:
        print("Grade: A+")
    }
}
studentReport(detail: .grande)



//Enum constants

enum Weekdays: String {
    case monday = "MONDAY"
    case tuesday = "TUESDAY"
    case wednesday = "WEDNESDAY"
    case thursday = "THURSDAY"
    case friday = "FRIDAY"
}

func getPickedDay(pickDay: Weekdays) {
    print("The picked day is: \(pickDay.rawValue)")
}

getPickedDay(pickDay: .friday)

func weekendPicked(whichDay: Weekdays) {
    switch whichDay {
    case .monday:
        print("\(whichDay.rawValue) is picked")
    case .tuesday:
        print("\(whichDay) is picked")
    case .wednesday:
        print("\(whichDay) is picked")
    case .thursday:
        print("\(whichDay) is picked")
    case .friday:
        print("\(whichDay) is picked")
    }
}

weekendPicked(whichDay: .monday)

//Case Iterable

enum SocialMedia: String, CaseIterable {
    case facebook = "This is Facebook"
    case instagram = "This is Instagram"
    case twitter = "This is Twitter"
    case youtube = "This is Youtube"
}

print(SocialMedia.allCases.count)

for plotform in SocialMedia.allCases {
    print(plotform.rawValue)
}


//Associated Enum
enum iOSApplications {
    case whatsapp(users: Int)
    case twitter(downloads: Int)
    case telegram
    case mail
}

func getHightDemandApps(app: iOSApplications) {
    switch app {
    case .whatsapp(users: let users) where users > 10_000:
        print("The app has \(app) users")
    case .twitter(downloads: let downloads) where downloads > 10_000:
        print("The app has\(app) downloads")
    case .telegram, .mail, .whatsapp, .twitter:
        print("The app \(app) have neither 10,000+ users, nor 10,000+ downloads")
    }
}
getHightDemandApps(app: .mail)
