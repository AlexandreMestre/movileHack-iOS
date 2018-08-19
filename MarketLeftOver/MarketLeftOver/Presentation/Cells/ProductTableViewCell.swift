//
//  ProductTableViewCell.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

protocol ProductCellDelegate {
    func addButtonTouched(onCellWith indexPath: IndexPath)
}

class ProductTableViewCell: UITableViewCell {
    
    var delegate: ProductCellDelegate?
    var indexPath: IndexPath?

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDueDate: UILabel!
    @IBOutlet weak var productNormalPrice: UILabel!
    @IBOutlet weak var productCurrentPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func addItemButtonTouched(_ sender: Any) {
        if let index = self.indexPath {
            self.delegate?.addButtonTouched(onCellWith: index)
        }
    }
}