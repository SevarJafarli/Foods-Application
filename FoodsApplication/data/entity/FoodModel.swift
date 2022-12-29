//
//  FoodModel.swift
//  FoodsApplication
//
//  Created by Sevar Jafarli on 23.12.22.
//

import Foundation

class FoodModel: Codable {
    var id: Int?
    var name: String?
    var image: String?
    var price: Int?
    var category: String?
    
    init(id: Int, name: String, image: String, price: Int, category: String) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
        self.category = category
    }
}
