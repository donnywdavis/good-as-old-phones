//
//  ProductsTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Donny Davis on 3/5/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up our products to display on the main view
        let product1 = Product()
        let product2 = Product()
        let product3 = Product()
        let product4 = Product()
        
        product1.name = "1907 Wall Set"
        product1.productImage = "phone-fullscreen1"
        product1.cellImage = "image-cell1"
        product1.price = 59.99
        
        product2.name = "1921 Dial Phone"
        product2.productImage = "phone-fullscreen2"
        product2.cellImage = "image-cell2"
        product2.price = 39.99
        
        product3.name = "1937 Desk Set"
        product3.productImage = "phone-fullscreen3"
        product3.cellImage = "image-cell3"
        product3.price = 0.99
        
        product4.name = "1984 Motorola Portable"
        product4.productImage = "phone-fullscreen4"
        product4.cellImage = "image-cell4"
        product4.price = 19.00
        
        products = [product1, product2, product3, product4]
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Get the count from our total products for the table view
        if let products = products {
            return products.count
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath)
        // Get the product to use based on the row index
        let product = products?[indexPath.row]
        
        // Set the product name and cell image
        if let product = product {
            cell.textLabel?.text = product.name
            if let cellImage = product.cellImage {
                cell.imageView?.image = UIImage(named: cellImage)
            }
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowProduct" {
            // Set our view to transition to for showing products
            let productVC = segue.destinationViewController as? ProductViewController
            
            // Make sure that we have a valid cell pressed and an index for that cell
            guard let cell = sender as? UITableViewCell,
                  let indexPath = tableView.indexPathForCell(cell) else {
                    return
            }
            
            // Pass the product for the tapped cell to the ProductViewController
            productVC?.product = products?[indexPath.row]
        }
    }
    
}
