//
//  FinishedModalController.swift
//  MarketLeftOver
//
//  Created by Larissa Ganaha on 19/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class FinishedModalController: UIViewController {
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        button.layer.cornerRadius = 15

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        print("Pressed")
        performSegue(withIdentifier: "unwindToMarketList", sender: self)
    }

}
