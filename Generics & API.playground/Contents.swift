import UIKit

//MARK: - Generics -- Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define.


func compareHigherValue<T: Comparable>(valueOne: T, valueTwo: T) {
    if valueOne == valueTwo {
        print("Both are same")
    } else {
        let higherValue = valueOne > valueTwo ? valueOne : valueTwo
        print("\(higherValue) is higher")
    }
}

compareHigherValue(valueOne: 10, valueTwo: 15)

//MARK: - API & Codable

// To easily parse JSON and similar formats, like XML or Property Lists (PLISTs), we can take advantage of the Codable protocol. Codable is a typealias for Decodable and Encodable protocols, meaning it provides a new name to an existing type: typealias Codable = Decodable & Encodable.


enum Result<T:Decodable> {
    case success(data:T) //Success response
    case failure(message:String)//APi call error
    case error(message:String) //Network error
}
struct DataModel: Codable {
    let products: [Product]
    enum CodingKeys: String, CodingKey {
        case products
    }
}
struct Product: Codable {
    let imageURL: String
    let description: String
    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case description
    }
}

func fetchGenericData<T: Codable>(urlString: String, completion: @escaping (Result<T>) -> ()) {
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { (data, responce, error) in
        
        guard let data = data, error == nil else {
            completion(Result<T>.error(message: "Failed to load url"))
            return
        }
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            completion(Result<T>.success(data: decodedData))
        } catch let decodingError {
            completion(Result<T>.error(message: "Failed to decode the json file: \(decodingError) url"))
        }
    }.resume()
}

fetchGenericData(urlString: "https://raw.githubusercontent.com/princesolomon/zstore/main/data.json") { (status: Result<DataModel>) in
    switch status {
    case .success(data: let data):
        print("Responce from the give url: \(data)")
    case .failure(message: let message):
        print("API Call geting failed due to: \(message)")
    case .error(message: let message):
        print("API Call geting failed due to: \(message)")
    }
}

