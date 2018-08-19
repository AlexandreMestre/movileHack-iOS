//
//  MarketListController.swift
//  MarketLeftOver
//
//  Created by Larissa Ganaha on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class MarketListController: UIViewController {

    @IBOutlet weak var label: UILabel!

    var listCellID = "marketListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        setupNavBarFont()
    }

    func setUpNavBar() {
        navigationController?.navigationBar.barTintColor = UIColor(red:1.00, green:0.84, blue:0.34, alpha:1.0)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.title = "XEPA!"

        setupNavBarFont()

    }

    func setupNavBarFont() {
        if let font = UIFont(name: "ComicPanels", size: 25) {
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "ComicPanels",
                                                                                                               size: 25)!]
            print("worked")
        }
    }

    @IBAction func unwindToMarketList(segue:UIStoryboardSegue) { }

}

extension MarketListController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listCellID,
                                                         for: indexPath) as? MarketListCollectionCell {
            return cell
        }
        return MarketListCollectionCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        performSegue(withIdentifier: "showMarketDetails", sender: nil)
    }
}
