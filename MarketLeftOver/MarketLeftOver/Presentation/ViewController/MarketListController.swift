//
//  MarketListController.swift
//  MarketLeftOver
//
//  Created by Larissa Ganaha on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class MarketListController: UIViewController {

    @IBOutlet weak var marketsCollectionView: UICollectionView!
    
    let marketService = ServiceFactory.marketService()
    
    var markets = [Market]()

    let listCellID = "marketListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        marketService.allMarkets { (markets) in
            if let markets = markets {
                self.markets = markets
                self.marketsCollectionView.reloadData()
            }
        }
        
        setUpNavBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setUpNavBar() {
        navigationController?.navigationBar.barTintColor = UIColor(red:1.00, green:0.84, blue:0.34, alpha:1.0)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    @IBAction func unwindToMarketList(segue:UIStoryboardSegue) { }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMarketDetails" {
            if let destination = segue.destination as? MarketDetailsController,
                let market = sender as? Market {
                destination.market = market
            }
        }
    }

}

extension MarketListController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.markets.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let market = self.markets[indexPath.row]
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listCellID, for: indexPath) as? MarketListCollectionCell {
            
            if let imageURL = market.logoImageURL {
                cell.marketLogo.kf.setImage(with: imageURL)
            }
            
            return cell
        }
        return MarketListCollectionCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showMarketDetails", sender: self.markets[indexPath.row])
    }

    
}
