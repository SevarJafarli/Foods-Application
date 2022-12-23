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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let f = food {
            foodTitle.text = f.name
            foodPrice.text = "$\(f.price!)"
            foodCategory.titleLabel?.text = f.category
            foodImage.image = UIImage(named: f.image!)
        }
        
        orderCount.text = "\(orderCounter.value.description)"
                orderCounter.maximumValue = 20
                orderCounter.minimumValue = 1

        // Do any additional setup after loading the view.
    }

    

    @IBAction func stepperChanged(_ sender: UIStepper) {
        orderCount.text = "\(sender.value.description)"
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
