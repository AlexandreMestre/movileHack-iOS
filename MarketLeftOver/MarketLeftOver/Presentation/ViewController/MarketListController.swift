//
//  MarketListController.swift
//  MarketLeftOver
//
//  Created by Larissa Ganaha on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class MarketListController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func nextView(_ sender: Any) {
        performSegue(withIdentifier: "showMarketDetails", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
