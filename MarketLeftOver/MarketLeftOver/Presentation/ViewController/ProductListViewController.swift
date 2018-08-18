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
    
    // MARK: - Constants
    let searchController = UISearchController(searchResultsController: nil)
    let productService = ServiceFactory.productService()
    let cellId = "productCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = category?.name

        setupSearchController()
        
        if let category = self.category, let market = self.market {
            self.productList = productService.products(ofCategory: category, from: market)
        } else {
            // TODO: - remove after debug
            let market = ServiceFactory.marketService().market(withId: "xxx")!
            let category = ServiceFactory.marketService().categories(of: market).first!
            
            self.productList = productService.products(ofCategory: category, from: market)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupSearchController() {
        self.productListTableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar produtos"
        searchController.searchBar.barTintColor = #colorLiteral(red: 0.9960784314, green: 0.8705882353, blue: 0.4588235294, alpha: 1)
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
                // TODO: - load image using kingFisher
                do {
                    let data = try Data(contentsOf: imageURL)
                    productCell.productImage.image = UIImage(data: data)
                } catch {
                    
                }
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/yyyy")
            productCell.productDueDate.text = "Validade: \(dateFormatter.string(from: product.dueDate))"
            
            let originalPriceText: NSMutableAttributedString =  NSMutableAttributedString(string: "R$ \(product.originalPrice)")
            originalPriceText.addAttribute(.strikethroughStyle, value: 1, range: NSMakeRange(0, originalPriceText.length))
            
            productCell.productNormalPrice.attributedText = originalPriceText
            productCell.productCurrentPrice.text = "R$ \(product.currentPrice)"
            
            return productCell
        }
        
        return UITableViewCell()
    }
    
}

extension ProductListViewController: ProductCellDelegate {
    func addButtonTouched(onCellWith indexPath: IndexPath) {
        
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
            
            var brand = product.brand.lowercased()
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
