//
//  CartScreen.swift
//  FoodsApplication
//
//  Created by Sevar Jafarli on 23.12.22.
//

import UIKit

class CartScreen: UIViewController {
    var cartProducts = [FoodModel]()
    @IBOutlet weak var cartProductsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var c1 = FoodModel(id: 1, name: "clickend", image: "food", price: 4, category: "Meals")
        cartProducts.append(c1)
        
        cartProductsTable.delegate = self
        cartProductsTable.dataSource = self
   
    }
    

  

}

extension CartScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartProduct = cartProducts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartProduct") as! CartProductTableViewCell
        cell.foodImage.image = UIImage(named: cartProduct.image!)
        cell.title.text = cartProduct.name
        cell.price.text  = "$\(cartProduct.price!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProducts.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailFromCart", sender: cartProducts[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action, view, bool) in
            
            let cartProduct = self.cartProducts[indexPath.row]
            
            let alert = UIAlertController(title: "Remove from cart", message: "Do you want to delete from cart?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Delete", style: .destructive){
                action in
                print("deleted")
//                self.homePresenterObject?.delete(person: person)
            }
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
            
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }


}

