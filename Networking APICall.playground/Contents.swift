import UIKit

//MARK: - Networking Call - API Using JSON

/*
 Async - await
 
 --Async stands for asynchronous and can be seen as a method attribute making it clear that a method performs asynchronous work
 
 func fetchImages() async throws -> [UIImage] {
     // .. perform data request
 }
 
 --Await is the keyword to be used for calling async methods. You can see them as best friends in Swift as one will never go without the other. You could basically say:
 do {
     let images = try await fetchImages()
     print("Fetched \(images.count) images.")
 } catch {
     print("Fetching images failed with error \(error)")
 }
 */


struct DataModel: Codable {
    let products: [Product]
    enum CodingKeys: String, CodingKey {
        case products
    }
}
struct Product: Codable {
    let imageURL: String
    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
    }
}
enum ModelError: Error {
    case invalidUrl
    case invalidResponce
    case invalidData
}

class Networking {
    let endPoint = "https://raw.githubusercontent.com/princesolomon/zstore/main/data.json"
    var responceData: DataModel?

    func fetchDataFromUrl() async throws -> DataModel {

        guard let url = URL(string: endPoint) else { throw ModelError.invalidUrl }
        
        let (data, responce) = try await URLSession.shared.data(from: url)
        
        guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else {
            throw ModelError.invalidResponce
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(DataModel.self, from: data)
        } catch {
            throw ModelError.invalidData
        }
    }

    func apiCall() async {
        do {
            responceData = try await fetchDataFromUrl()
            print("Decoded data from the give API \([responceData?.products[0].imageURL])")
        } catch ModelError.invalidData {
            print("The data is invalid")
        } catch ModelError.invalidResponce {
            print("The Responce is invalid")
        } catch ModelError.invalidUrl {
            print("The Url is invalid")
        } catch {
            print("Unknown error")
        }
    }
}
var networkingClass = Networking()
await networkingClass.apiCall()




    
