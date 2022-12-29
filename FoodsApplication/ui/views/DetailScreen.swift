//
//  DetailScreen.swift
//  FoodsApplication
//
//  Created by Sevar Jafarli on 23.12.22.
//

import UIKit

class DetailScreen: UIViewController {
    var food:FoodModel?
    
    @IBOutlet weak var foodCategory: UIButton!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    
    @IBOutlet weak var orderCounter: UIStepper!
    @IBOutlet weak var orderCount: UILabel!
    
    @IBOutlet weak var totalAmount: UILabel!
    
    var viewModel = AddToCartViewModel()
    var cartViewModel = CartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let f = food {
            foodTitle.text = f.name
            foodPrice.text = "$\(f.price!)"
            foodCategory.titleLabel?.text = f.category
            
            foodImage.setImageFromUrl(ImageURL:  "http://kasimadalan.pe.hu/foods/images/\(f.image!)")
            
            orderCount.text = "\(Int(orderCounter.value))"
            orderCounter.maximumValue = 20
            orderCounter.minimumValue = 1
            
            let count:Int? = Int(orderCounter.value)
            let price:Int? = f.price
            
            if let c = count, let p = price {
                totalAmount.text = "Total is $\(c * p)"
            }
           
            
           
        }
        
    }

    @IBAction func stepperChanged(_ sender: UIStepper) {
        orderCount.text = "\(Int(sender.value))"
        
        let count:Int? = Int(sender.value)
        let price:Int? = food?.price
        
        if let c = count, let p = price {
            totalAmount.text = "Total $\(c * p)"
        }
        print("Sender value \(orderCount.text!)")
    }
    @IBAction func btnAddToCart(_ sender: Any) {
        
      
        let count:Int? = Int(orderCount.text!)
        if let c = count {
            self.viewModel.addToCart(food: self.food!, orderAmount: Int(self.orderCounter.value))
            
            cartViewModel.cartFoodsList.subscribe(
                onNext: { element in
                    print(element.count)
                })
           
            
           
            
           
//                cartViewModel.cartFoodsList.asObservable().subscribe{ (newValue) in
//                    if let models =  newValue.element {
//                        print("Before:\(models.count)")
//                        self.viewModel.addToCart(food: self.food!, orderAmount: Int(self.orderCounter.value))
//
//                        print("After:\(models.count)")
//                    }
                   
             
                
//                var models:[CartFoodModel] = try cartViewModel.cartFoodsList.value()
//                print("Count Nefore: \(models.count)")
//
//                if  let existCardModel = (models.first(where: { $0.name == food?.name }))  {
//                    let count:Int = existCardModel.orderAmount!
//                    cartViewModel.removeFromCart(cartId: existCardModel.cartId!)
//                    viewModel.addToCart(food: food!, orderAmount: count + Int(orderCounter.value))
//                    print("Element already exists")
//                }
//                else {
//                    viewModel.addToCart(food: food!, orderAmount: Int(orderCounter.value))
//                    print("Element not exists")
//                }
//
//                models = try! cartViewModel.cartFoodsList.value()
//                print("CountAfter: \(models.count)")
//
                
              
          
        
        }
          
      
    
       
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



