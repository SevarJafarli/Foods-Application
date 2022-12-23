//
//  ViewController.swift
//  FoodsApplication
//
//  Created by Sevar Jafarli on 23.12.22.
//

import UIKit

class HomeViewController: UIViewController {
    var foods = [FoodModel]()

    @IBOutlet weak var foodCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let f1 = FoodModel(id: 1, name: "Grilled Chicken", image:"food" , price: 15, category: "Meal")
        let f2 = FoodModel(id: 2, name: "Meatball", image:"food" , price: 5, category: "Meal")
          foods.append(f1)
        foods.append(f2)
        foods.append(f2)
        foods.append(f2)
        foods.append(f2)
        foods.append(f2)
        foods.append(f2)
        foods.append(f2)
        
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
        //10 X 10 X 10 = 30 (total space)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30) / 2
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        
        foodCollectionView.collectionViewLayout = layout
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let food = sender as? FoodModel {
                let detailScreen = segue.destination as! DetailScreen
                
                detailScreen.food = food
            }
        }
    }


}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let food = foods[indexPath.row]
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodCardViewCell
        
        cell.foodTitle.text = food.name
        cell.foodImage.image = UIImage(named: food.image!)
        
        cell.foodPrice.text = "$\(food.price!)"
        
       
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
            performSegue(withIdentifier: "toDetail", sender: foods[indexPath.row])
//            collectionView.deselectRow(at: indexPath, animated: true)
//
//
       
    }
}
