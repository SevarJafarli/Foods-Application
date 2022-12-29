//
//  FoodsDaoRepository.swift
//  FoodsApplication
//
//  Created by Sevar Jafarli on 23.12.22.
//

import Foundation
import RxSwift
import Alamofire

class FoodsDaoRepository {
    let username = "abbb"
    var foodsList = BehaviorSubject<[FoodModel]>(value: [FoodModel]())
    var cartFoodsList = BehaviorSubject<[CartFoodModel]>(value: [CartFoodModel]())
    
    func getAllFoods() {
        AF.request("http://kasimadalan.pe.hu/foods/getAllFoods.php", method: .get).response { response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    
                    if let list = result.foods {
                        self.foodsList.onNext(list)
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    func getCartFoods() {
        let params:Parameters = ["userName": username]
        AF.request("http://kasimadalan.pe.hu/foods/getFoodsCart.php", method: .post, parameters: params).response { response in
            if let data = response.data {
              
                do {
                    let result = try JSONDecoder().decode(CartFoodsResponse.self, from: data)
                   
                    if let list = result.foods_cart {
                        self.cartFoodsList.onNext(list)
                        
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func addToCart(food:FoodModel, orderAmount:Int){
        let params:Parameters = ["name": food.name!, "image": food.image!, "price": food.price!, "category": food.category!, "orderAmount": orderAmount, "userName": username]
        
      
        AF.request("http://kasimadalan.pe.hu/foods/insertFood.php", method: .post,  parameters: params).response {
            response in
            if let data = response.data {
                do {
                    let result = try JSONSerialization.jsonObject(with: data)
                    print(result)
                }
                catch {
                    print(error.localizedDescription)
                }
            }
            
          
        }
    }
    
    func removeFromCart(cartId:Int){
        let params:Parameters = ["cartId" :cartId, "userName": username]
        
        AF.request("http://kasimadalan.pe.hu/foods/deleteFood.php", method:.post, parameters: params).response {
            response in
        
            if let data = response.data {
                do {
                    let result = try JSONSerialization.jsonObject(with: data)
                    
                    print(result)
                    
                    self.getCartFoods()
                }
                catch {
                    
                    print(error.localizedDescription)
                }
            }
        }
    }

   
}

