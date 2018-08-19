//
//  MarketDetailsController.swift
//  MarketLeftOver
//
//  Created by Larissa Ganaha on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class MarketDetailsController: UIViewController {

    var tableViewCellHeight = 66.0
    var tableViewHeaderHeight = 45.0
    var navigationTitle = "Nome do mercado"
    var listCellID = "cellList"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = navigationTitle

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MarketDetailsController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: listCellID) as? MarketDetailsTableCell {
            cell.categoryNameLabel.text = "Section \(indexPath.row)"
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
        print(indexPath.row)
        performSegue(withIdentifier: "showProductList", sender: nil)
    }
}

extension MarketDetailsController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? MarketDetailsCollectionCell {
        return cell
        }
        return MarketDetailsCollectionCell()
    }

    
}
