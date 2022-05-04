import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let error: Bool
    let message: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let productPk: Int
    let name, datumDescription, price: String
    let image: String
    let genre, stock, author: String

    enum CodingKeys: String, CodingKey {
        case productPk = "product_pk"
        case name
        case datumDescription = "description"
        case price, image, genre, stock, author
    }
}
