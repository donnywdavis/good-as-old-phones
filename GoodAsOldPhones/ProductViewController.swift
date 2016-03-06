//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by Donny Davis on 3/5/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    // Set an outlet to connect to the label and image in the view to set
    // their values
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    // Create a product variable to store the object passed from the table view
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the product name and image passed from the table view
        if let product = product {
            productNameLabel.text = product.name
            if let productImage = product.productImage {
                productImageView.image = UIImage(named: productImage)
            }
        }
    }
    
    @IBAction func addToCartPressed(sender: UIButton) {
        print("Button pressed")
    }
    
}
