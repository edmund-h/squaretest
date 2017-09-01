//
//  ViewController.swift
//  SquareTest
//
//  Created by Edmund Holderbaum on 8/31/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit
import SquarePointOfSaleSDK

class SquarePayViewController: UIViewController {

    @IBOutlet weak var sqbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func payMoney() {
        // Replace with your app's URL scheme.
        let yourCallbackURL = URL(string: "sqtst://")!
        
        // Your client ID is the same as your Square Application ID.
        // Note: You only need to set your client ID once, before creating your first request.
        SCCAPIRequest.setClientID("sq0idp-YCuMUG4-Ns5Wq4DZ9zXcig")
        
        do {
            // Specify the amount of money to charge.
            let money = try SCCMoney(amountCents: 100, currencyCode: "USD")
            
            // Create the request.
            let apiRequest =
                try SCCAPIRequest(
                    callbackURL: yourCallbackURL,
                    amount: money,
                    userInfoString: nil,
                    merchantID: nil,
                    notes: "Coffee",
                    customerID: nil,
                    supportedTenderTypes: .card ,
                    clearsDefaultFees: false,
                    returnAutomaticallyAfterPayment: false
            )
            
            // Open Point of Sale to complete the payment.
            try SCCAPIConnection.perform(apiRequest)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    

}

