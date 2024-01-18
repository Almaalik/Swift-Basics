import UIKit

//Type casting is a way to check the type of an instance, or to treat that instance as a different superclass or subclass from somewhere else in its own class hierarchy.

//1. Data Type Conversions
var myDouble = 5.0
var myInt = Int(myDouble)
print(myInt)
// 5
print(type(of: myInt))
// Int

/*
 2.Type Casting Syntax
 * is for Type Checking
 * as? for Optional Downcasting
 * as! for Force Downcasting
 * as for Upcasting
*/

class TVShow{
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: TVShow{
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class TalkShow: TVShow{
    var host: String
    init(name: String, host: String) {
        self.host = host
        super.init(name: name)
    }
}

let theBucketList = Movie(name: "The Bucket List", director: "Rob Reiner")
let interstellar = Movie(name: "Interstellar", director: "Christopher Nolan")
let theTonightShow = TalkShow(name: "The Tonight Show Starring Jimmy Fallon", host: "Jimmy Fallon")


let tvSchedule = [theBucketList, interstellar, theTonightShow]
// let tvSchedule: [TVShow]

/*
 3.Type Checking
 Type Checking, is, checks which class an instance belongs to. The expression returns a value of type Bool.
 */

// Checking Type
var movieCount = 0
var talkShowCount = 0

for item in tvSchedule{
    if item is Movie{               // Checking Type with 'is'
        movieCount += 1
    }else if item is TalkShow{
        talkShowCount += 1
    }
}
print("Today, there is/are \(movieCount) Movie(s), \(talkShowCount) Talk Show(s)")
// Today, there is/are 2 Movie(s), 1 Talk Show(s)

/*
 4.Optional Downcasting
 Optional Downcasting, as?, returns an optional value of the type that you are trying to downcast to.
 */

var myMovie = tvSchedule[0] as? Movie
print(myMovie?.name ?? "")
// Optional("The Bucket List")

var myTalkShow = tvSchedule[0] as? TalkShow
print(myTalkShow?.name ?? "")
// Nothing Happens. Because 0-index item is not a TalkShow object

/*
 5.Force Downcasting
 The forced form, as!, attempts the downcast and force-unwraps the result as a single compound action.
 */

var myMovieForce = tvSchedule[0] as! Movie
print(myMovieForce.name)
// The Bucket List

var myTalkShowForce = tvSchedule[0] as! TalkShow
print(myTalkShowForce.name)
// CRASHED!

/*
 6.Upcasting
 With Upcasting, a class is requested to behave like its base class. Since the derived class will already have base class properties, no error will occur.
 */

var myTVShow = interstellar as TVShow
print(myTVShow.name)
// Interstellar
