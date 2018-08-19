//
//  MarketDetailsController.swift
//  MarketLeftOver
//
//  Created by Larissa Ganaha on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit
import Kingfisher

class MarketDetailsController: UIViewController {

    var tableViewCellHeight = 66.0
    var tableViewHeaderHeight = 45.0
    var navigationTitle = "Mercado"
    let listCellID = "cellList"
    let itemAddedFeedBackViewHeight = 60
    
    var market: Market?
    
    var categories = [Category]()
    
    var bestDeals = [Product]()
    var bestDeasCollectionView: UICollectionView?
    
    @IBOutlet weak var feedBackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var categoriesTableView: UITableView!
    @IBOutlet weak var bestDealsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let market = self.market {
            
            setupNavigationBar(market)
            
            ServiceFactory.marketService().categories(of: market) { (categories) in
                if let categories = categories {
                    self.categories = categories
                    self.categoriesTableView.reloadData()
                }
            }
            
            ServiceFactory.productService().bestProducts(from: market) { (products) in
                if let products = products {
                    self.bestDeals = products
                    self.bestDealsCollectionView.reloadData()
                }
            }
        }

        self.navigationItem.title = navigationTitle

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        navigationTitle = market.name
        if let font = UIFont(name: "Poppins-Semibold", size: 17) {
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Poppins-Semibold", size: 17)!]
        }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductList" {
            if let destination = segue.destination as? ProductListViewController,
                let category = sender as? Category {
                destination.market = self.market
                destination.category = category
            }
        }
    }
    
    func setupNavigationBar(_ market: Market) {
        navigationTitle = market.name
        let cartButton = UIBarButtonItem(image: #imageLiteral(resourceName: "cart"), style: .plain, target: self, action: #selector(self.cartButtonTouched))
        cartButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.navigationItem.rightBarButtonItem = cartButton
    }
    
    func presentItemAddedFeedbackView() {
        self.feedBackViewTopConstraint.constant = CGFloat(itemAddedFeedBackViewHeight)
        
        UIView.animate(withDuration: 0.8, animations: {
            self.view.layoutIfNeeded()
        }) { (_) in
            self.feedBackViewTopConstraint.constant = 0
            UIView.animate(withDuration: 0.8, delay: 0.5, options: .beginFromCurrentState, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    @objc func cartButtonTouched() {
        self.performSegue(withIdentifier: "showShoppingCart", sender: nil)
    }
}

extension MarketDetailsController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: listCellID) as? MarketDetailsTableCell {
            let category = categories[indexPath.row]
            
            cell.categoryNameLabel.text = category.name
            
            if let imageURL = category.iconURL {
                cell.categoryIconImage.kf.setImage(with: imageURL)
            }
            
            return cell
        }
        return MarketDetailsTableCell()

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: "Poppins-SemiBold", size: 18)
        titleLabel.text = "Categorias"
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showProductList", sender: self.categories[indexPath.row])
    }
}

extension MarketDetailsController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.bestDeals.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? MarketDetailsCollectionCell {
            let product = bestDeals[indexPath.row]
            
            cell.indexPath = indexPath
            cell.delegate = self
            
            cell.bestDealNameLabel.text = product.name
            
            if let imageURL = product.imageURL {
                cell.bestDealImage.kf.setImage(with: imageURL)
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/yyyy")
            if let date = product.dueDate {
                cell.bestDealDueDateLabel.text = "\(dateFormatter.string(from: date))"
            } else {
                cell.bestDealDueDateLabel.text = "----"
            }
            cell.bestDealPriceLabel.text = String(format: "R$%.02f", product.currentPrice)

            return cell
        }
        
        return MarketDetailsCollectionCell()
    }
}

extension MarketDetailsController: ProductCellDelegate {
    func addButtonTouched(onCellWith indexPath: IndexPath) {
        let product = bestDeals[indexPath.row]
        
        ServiceFactory.shoppingCartService().add(product: product, quantity: 1)
        
        presentItemAddedFeedbackView()
    }
}
