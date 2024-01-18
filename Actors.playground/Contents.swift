import UIKit

//MARK: - Actors

//Swift’s actors are conceptually like classes that are safe to use in concurrent environments. This safety is made possible because Swift automatically ensures no two pieces of code attempt to access an actor’s data at the same time – it is made impossible by the compiler, rather than requiring developers to write boilerplate code using systems such as locks.

//Actors do not support inheritance, so they cannot have convenience initializers, and do not support either final or override.

//As well as those, there is one more behavior of actors that lies at the center of their existence: if you’re attempting to read a variable property or call a method on an actor, and you’re doing it from outside the actor itself, you must do so asynchronously using await.

class Users {
    let id: String
    let name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

actor UserStorage {
    
    private var store = [String: Users]()
    
    func get(_ id: String) -> Users? {
        return store[id]
    }
    
    func save(_ user: Users) {
        store[user.id] = user
    }
}

let user = Users(id: "123", name: "Maalik")

Task {
    let storage = UserStorage()
    await storage.save(user)
    let get = await storage.get("123")
    print("User: \(get?.name) & \(get?.id)")
}

