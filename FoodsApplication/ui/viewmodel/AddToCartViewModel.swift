//
//  AddToCartViewModel.swift
//  FoodsApplication
//
//  Created by Sevar Jafarli on 23.12.22.
//

import Foundation
import RxSwift
class AddToCartViewModel {
    var prepo = FoodsDaoRepository()
    
    func addToCart(food:FoodModel, orderAmount:Int){
     
        prepo.addToCart(food: food, orderAmount: orderAmount)
    }
}
