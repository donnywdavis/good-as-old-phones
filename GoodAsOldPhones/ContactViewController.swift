//
//  ContactViewController.swift
//  GoodAsOldPhones
//
//  Created by Donny Davis on 3/5/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    // Set an outlet to connect with the scroll view
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add our scrollView to the view
        view.addSubview(scrollView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Set the content size for the scroll view
        scrollView.contentSize = CGSizeMake(375, 800)
    }

}
