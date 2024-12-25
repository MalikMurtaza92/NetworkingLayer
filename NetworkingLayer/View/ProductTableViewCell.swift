//
//  ProductTableViewCell.swift
//  NetworkingLayer
//
//  Created by Murtaza Mehmood on 25/12/2024.
//

import UIKit
import SDWebImage

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    func configure(image: String, title: String, description: String, price: Double) {
        productTitle.text = title
        productDescription.text = description
        productPrice.text = "$\(price)"
        guard let url = URL(string: image) else { return }
        productImage.sd_setImage(with: url)
    }
}
