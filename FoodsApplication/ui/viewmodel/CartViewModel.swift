//
//  CartViewModel.swift
//  FoodsApplication
//
//  Created by Sevar Jafarli on 23.12.22.
//

import Foundation
import RxSwift

class CartViewModel {
    var cartFoodsList = BehaviorSubject<[CartFoodModel]>(value: [CartFoodModel]())
    
    var prepo = FoodsDaoRepository()
    
    init(){
        loadCartFoods()
        cartFoodsList = prepo.cartFoodsList
    }
    
    func loadCartFoods(){
        prepo.getCartFoods()
    }
    
    func removeFromCart(cartId:Int){
        prepo.removeFromCart(cartId: cartId)
    }
}
