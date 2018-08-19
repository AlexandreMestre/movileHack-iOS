//
//  CheckoutController.swift
//  MarketLeftOver
//
//  Created by Larissa Ganaha on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class CheckoutController: UIViewController {

    @IBOutlet weak var finishButton: UIButton!

    var navigationTitle = "Pagamento"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = navigationTitle
        finishButton.layer.cornerRadius = 20

        let dismissTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector (dismissKeyboard))
        dismissTap.cancelsTouchesInView = false
        view.addGestureRecognizer(dismissTap)
    }


    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func pressed(_ sender: Any) {
        performSegue(withIdentifier: "modalShowUp", sender: nil)
    }

}
