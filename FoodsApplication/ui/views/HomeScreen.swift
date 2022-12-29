//
//  ViewController.swift
//  FoodsApplication
//
//  Created by Sevar Jafarli on 23.12.22.
//

import UIKit

class HomeScreen: UIViewController {
    var foods = [FoodModel]()
    var viewModel = HomeViewModel()
    

    @IBOutlet weak var foodCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
        _ = viewModel.foodsList.subscribe(onNext: { list in
           self.foods = list
           DispatchQueue.main.async {
               self.foodCollectionView.reloadData()
           }
          
       })
        
        //10 X 10 X 10 = 30 (total space)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
       
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30) / 2
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
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

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let food = foods[indexPath.row]
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodCardViewCell
        
        cell.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = true
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        
        
        cell.foodTitle.text = food.name
        
        cell.foodImage.setImageFromUrl(ImageURL:  "http://kasimadalan.pe.hu/foods/images/\(food.image!)")
            cell.foodPrice.text = "$\(food.price!)"
            
            
           
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toDetail", sender: foods[indexPath.row])
        
    }
       
    
}
