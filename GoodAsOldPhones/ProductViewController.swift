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
        // Make sure that we have a product and product name set
        guard let product = product, let name = product.name, let price = product.price else {
            return
        }
        
        // Create an order
        let order = Order()
        order.product = product
        
        // Get any existing orders and create empty array if none are found
        var ordersInCart = Orders.readOrdersFromArchive()
        if ordersInCart == nil {
            ordersInCart = []
        }
        // Add the new order to the orders array
        ordersInCart?.append(order)
        // Save the orders
        if let orders = ordersInCart {
            Orders.saveOrdersToArchive(orders)
        }
        
        
        // Create an alert when the add to cart button
        let alertController = UIAlertController(title: "Added to Cart", message: "You added \(name) to the cart and it costs $\(price)", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        
        // Display the alert
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}
