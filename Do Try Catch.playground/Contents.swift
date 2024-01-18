import UIKit

enum ErrorThrowing: Error {
    case BadUserName
    case BadPassword
}


func setUserCredential(userName: String, password: String) throws {
    if userName.count < 4  {
        throw ErrorThrowing.BadUserName
    }
    
    if (password.rangeOfCharacter(from: NSCharacterSet.decimalDigits) == nil) {
        throw ErrorThrowing.BadPassword
    }
    print("Passed")
}

try setUserCredential(userName: "abdul", password: "abdul1")

//MARK: - Do Catch

    do {
        try setUserCredential(userName: "abdul", password: "abdul")
    } catch {
        switch error {
        case ErrorThrowing.BadUserName:
            print("Short user name")
        case ErrorThrowing.BadUserName:
            print("Password doesn't contain numeric")
        default:
            break
        }
    }


//MARK: - Try?
try? setUserCredential(userName: "abdul", password: "abdul")

if (try? setUserCredential(userName: "abdul", password: "abdul3")) == nil {
    print("Failed")
} else {
    print("Function call passed")
}


func
loginCredential(name: String, password: String) {
    guard (try? setUserCredential(userName: name, password: password)) != nil else {
        print("Validation failed")
        return
    }
    print("Guard statement succeded")
}

loginCredential(name: "Abdul", password: "qwe6rty")


//MARK: - try!
let personJSON = """
{
"name": "Abdul",
"age": 27
}
"""

struct Person: Codable {
var name: String
var age: Int
}

let decoder = JSONDecoder()
let parseJsonData = personJSON.data(using: .utf8)!

let personData = try! decoder.decode(Person.self, from: parseJsonData)
print("Decoded data: \(personData)")
