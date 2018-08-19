//
//  MarketDetailsCollectionCell.swift
//  MarketLeftOver
//
//  Created by Larissa Ganaha on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class MarketDetailsCollectionCell: UICollectionViewCell {
    var indexPath: IndexPath?
    var delegate: ProductCellDelegate?
    
    @IBOutlet weak var bestDealImage: UIImageView!
    @IBOutlet weak var bestDealNameLabel: UILabel!
    @IBOutlet weak var bestDealDueDateLabel: UILabel!
    @IBOutlet weak var bestDealPriceLabel: UILabel!
    @IBOutlet weak var bestDealButton: UIButton!

    override func awakeFromNib() {
        bestDealButton.layer.cornerRadius = 10
    }

    @IBAction func bestDealPressed(_ sender: Any) {
        if let index = self.indexPath {
            delegate?.addButtonTouched(onCellWith: index)
        }
    }
}

