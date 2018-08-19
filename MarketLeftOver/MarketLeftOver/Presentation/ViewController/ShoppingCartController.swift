//
//  ShoppingCartController.swift
//  MarketLeftOver
//
//  Created by Larissa Ganaha on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class ShoppingCartController: UIViewController {
   
    @IBOutlet weak var orderValueLabel: UILabel!
    @IBOutlet weak var finishOrderButton: UIButton!
    @IBOutlet weak var itensInCartTableView: UITableView!
    
    var tableViewCellHeight = 66.0
    var tableViewHeaderHeight = 45.0
    var cartCellID = "shoppingCartCell"
    var navigationTitle = "Pedido"

    let cartService = ServiceFactory.shoppingCartService()
    var shoppingCart: ShoppingCart?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shoppingCart = cartService.shoppingCart()
        self.orderValueLabel.text = String(format: "R$%.02f", shoppingCart?.totalPrice ?? 0.00)
        self.itensInCartTableView.reloadData()

        finishOrderButton.layer.cornerRadius = 20
        navigationItem.title = navigationTitle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func finishOrderPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToCheckout", sender: nil)
    }
}

extension ShoppingCartController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shoppingCart?.itens.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cartCellID, for: indexPath) as? ShoppingCartCell,
           let cartItem = shoppingCart?.itens[indexPath.row] {
                
            cell.productNameLabel.text = "\(cartItem.product.name)"
            cell.priceLabel.text = String(format: "R$%.02f", cartItem.product.currentPrice * Double(cartItem.quantity))
            cell.quantityLabel.text = "x\(cartItem.quantity)"
            
            return cell
        }
        return ShoppingCartCell()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: "Poppins-SemiBold", size: 18)
        titleLabel.text = "Pedido"
        titleLabel.frame = CGRect(x: 20, y:10, width: view.bounds.width, height: 30)
        headerView.backgroundColor = .white
        headerView.addSubview(titleLabel)
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(tableViewHeaderHeight)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(tableViewCellHeight)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // TODO: handle delete
            tableView.reloadData()
            // TODO: update orderValueLabel
        }
    }


}
