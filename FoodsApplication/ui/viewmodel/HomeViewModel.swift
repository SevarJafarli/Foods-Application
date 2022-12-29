//
//  HomeViewModel.swift
//  FoodsApplication
//
//  Created by Sevar Jafarli on 23.12.22.
//

import Foundation
import RxSwift

class HomeViewModel {
    var foodsList = BehaviorSubject<[FoodModel]>(value: [FoodModel]())
    var prepo = FoodsDaoRepository()
    
    init(){
        loadFoods()
        foodsList = prepo.foodsList
    }
    
    func loadFoods(){
        prepo.getAllFoods()
    }
}
