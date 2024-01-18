import UIKit


class NotificationPost {
 
    func postNotification() {
        NotificationCenter.default.post(name: .myNotification, object: nil, userInfo: ["Notification": "NotificationTriggred"])
    }
}

class NotificationReceive {
    
    func setupObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleNotification(_:)), name: .myNotification, object: nil)
    }
    
    func clearObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleNotification(_ sender: Notification) {
        print("Printing the posted notification data: \(sender.userInfo?["Notification"] as? String ?? "Nil")")
        self.clearObserver()
    }
}



extension NSNotification.Name {
    static let myNotification = NSNotification.Name("myNotification")
}


var receiverClass = NotificationReceive()
receiverClass.setupObserver()


var postClass = NotificationPost()
postClass.postNotification()


//MARK: - UserDefaults

UserDefaults.standard.setValue("Abdul", forKey: "abcd")
print(UserDefaults.standard.string(forKey: "abcd") ?? "")

UserDefaults.standard.set(true, forKey: "has-seen-onboarding")
UserDefaults.standard.set(["AAPL", "TSLA"], forKey: "favorite-stocks")

print(UserDefaults.standard.bool(forKey: "has-seen-onboarding"))
// Prints: true
print(UserDefaults.standard.array(forKey: "favorite-stocks") ?? [])
// Prints: ["AAPL", "TSLA"]


/*
 User Defaults support the following types:

 Data
 Strings
 Numbers (NSNumber)
 Dates
 Arrays
 Dictionaries
 Booleans
 */
