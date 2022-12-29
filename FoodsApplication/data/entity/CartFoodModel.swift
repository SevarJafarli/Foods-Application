
import Foundation

class CartFoodModel:Codable {
    var cartId: Int?
    var name:String?
    var image: String?
    var price: Int?
    var category: String?
    var orderAmount: Int?
    var userName:String?
    
    
    init(cartId: Int, name:String, image: String, price: Int, category: String, orderAmount: Int, userName: String) {
        self.cartId = cartId
        self.name = name
        self.image = image
        self.price = price
        self.category = category
        self.orderAmount = orderAmount
        self.userName = userName
    }

    
}
