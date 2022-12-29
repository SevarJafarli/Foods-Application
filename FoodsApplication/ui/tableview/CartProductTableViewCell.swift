//
//  CartProductTableViewCell.swift
//  FoodsApplication
//
//  Created by Sevar Jafarli on 23.12.22.
//

import UIKit

class CartProductTableViewCell: UITableViewCell {


    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var count: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension UIImageView {
    func setImageFromUrl(ImageURL :String) {
       URLSession.shared.dataTask( with: NSURL(string:ImageURL)! as URL, completionHandler: {
          (data, response, error) -> Void in
          DispatchQueue.main.async {
             if let data = data {
                self.image = UIImage(data: data)
             }
          }
       }).resume()
    }
}

