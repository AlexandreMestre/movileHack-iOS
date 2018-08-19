//
//  ProductListViewController.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {
    
    /// Must be assigned when perfoming segue from previous view controller
    var market: Market?
    
    /// Must be assigned when perfoming segue from previous view controller
    var category: Category?
    
    var productList = [Product]()
    var filteredProductList = [Product]()
    
    @IBOutlet weak var productListTableView: UITableView!
    @IBOutlet weak var itemAddViewTopConstraint: NSLayoutConstraint!
    
    // MARK: - Constants
    let searchController = UISearchController(searchResultsController: nil)
    let productService = ServiceFactory.productService()
    let itemAddedFeedBackViewHeight = 60
    let cellId = "productCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupSearchController()
        
        self.productListTableView.addTopBackgound(color: #colorLiteral(red: 0.9960784314, green: 0.8705882353, blue: 0.4588235294, alpha: 1))
        
        if let category = self.category, let market = self.market {
            productService.products(ofCategory: category, from: market) { (products) in
                if let products = products {
                    self.productList = products
                    self.productListTableView.reloadData()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = category?.name ?? "Produtos"
        let cartButton = UIBarButtonItem(image: #imageLiteral(resourceName: "cart"), style: .plain, target: self, action: #selector(self.cartButtonTouched))
        cartButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.navigationItem.rightBarButtonItem = cartButton
    }
    
    func setupSearchController() {
    
        self.productListTableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar produtos"
        searchController.searchBar.barTintColor = #colorLiteral(red: 0.9960784314, green: 0.8431372549, blue: 0.337254902, alpha: 1)
        searchController.searchBar.tintColor = #colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1)
        searchController.searchBar.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.8431372549, blue: 0.337254902, alpha: 1)
    }
    
    @objc func cartButtonTouched() {
        self.performSegue(withIdentifier: "shoppingCart", sender: self)
    }
}

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering() {
            return self.filteredProductList.count
        } else {
            return self.productList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var product: Product
        
        if isFiltering() {
            product = self.filteredProductList[indexPath.row]
        } else {
            product = self.productList[indexPath.row]
        }
        
        if let productCell = tableView.dequeueReusableCell(withIdentifier: cellId) as? ProductTableViewCell {
            
            productCell.indexPath = indexPath
            productCell.delegate = self
            
            productCell.productName.text = product.name
            if let imageURL = product.imageURL {
                productCell.productImage.kf.setImage(with: imageURL)
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/yyyy")
            if let date = product.dueDate {
                productCell.productDueDate.text = "Validade: \(dateFormatter.string(from: date))"
            } else {
                productCell.productDueDate.text = "Validade: ----"
            }
            let originalPriceText: NSMutableAttributedString =  NSMutableAttributedString(string: String(format: "R$%.02f", product.originalPrice))
            originalPriceText.addAttribute(.strikethroughStyle, value: 1, range: NSMakeRange(0, originalPriceText.length))
            
            productCell.productNormalPrice.attributedText = originalPriceText
            productCell.productCurrentPrice.text = String(format: "R$%.02f", product.currentPrice)
            
            return productCell
        }
        
        return UITableViewCell()
    }
    
}

extension ProductListViewController: ProductCellDelegate {
    func presentItemAddedFeedbackView() {
        self.itemAddViewTopConstraint.constant = CGFloat(itemAddedFeedBackViewHeight)
        
        UIView.animate(withDuration: 0.8, animations: {
            self.view.layoutIfNeeded()
        }) { (_) in
            self.itemAddViewTopConstraint.constant = 0
            UIView.animate(withDuration: 0.8, delay: 0.5, options: .beginFromCurrentState, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func addButtonTouched(onCellWith indexPath: IndexPath) {
        var product: Product
        
        if isFiltering() {
            product = filteredProductList[indexPath.row]
        } else {
            product = productList[indexPath.row]
        }
        
        ServiceFactory.shoppingCartService().add(product: product, quantity: 1)
        
        presentItemAddedFeedbackView()
        
    }
}

extension ProductListViewController: UISearchResultsUpdating {
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredProductList = productList.filter({ (product: Product) -> Bool in
            
            var searchText = (searchController.searchBar.text!).lowercased()
            searchText = searchText.folding(options: .diacriticInsensitive, locale: .current)
            
            var productName = product.name.lowercased()
            productName = productName.folding(options: .diacriticInsensitive, locale: .current)
            
            var brand = product.brand?.lowercased() ?? ""
            brand = brand.folding(options: .diacriticInsensitive, locale: .current)
            
            if productName.contains(searchText) || brand.contains(searchText) {
                return true
            } else {
                return false
            }
        })
        
        self.productListTableView.reloadData()
    }
}
