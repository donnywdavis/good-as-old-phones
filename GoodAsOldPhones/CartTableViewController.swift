//
//  CartTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Donny Davis on 3/5/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    
    var ordersInCart: [Order]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableHeaderView = headerView
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let product = Product()
        product.name = "1907 Wall Set"
        product.productImage = "phone-fullscreen1"
        product.cellImage = "image-cell1"
        product.price = 59.99
        
        let order = Order()
        order.product = product
        
        ordersInCart = [order]
        updateTotal()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersInCart?.count ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CartCell", forIndexPath: indexPath)
        
        // Grab the order associated wih the cell row
        let order = ordersInCart?[indexPath.row]
        
        // Populate the cell row with the product details
        if let order = order {
            cell.textLabel?.text = order.product?.name
            cell.detailTextLabel?.text = String(order.product?.price)
        }

        return cell
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            ordersInCart?.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            updateTotal()
        }
    }
    
    func updateTotal() {
        if let orders = ordersInCart {
            var total = 0.0
            
            for order in orders {
                if let price = order.product?.price {
                    total += price
                }
            }
            totalLabel.text = String(total)
        }
    }

}
