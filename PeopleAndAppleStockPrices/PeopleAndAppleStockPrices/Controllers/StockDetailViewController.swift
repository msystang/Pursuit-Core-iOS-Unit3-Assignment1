//
//  StockDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Sunni Tang on 9/4/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class StockDetailViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var closeLabel: UILabel!
    @IBOutlet weak var stockImage: UIImageView!
    
    var stock: Stock!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
        loadImage()
        updateBackgroundColor()
    }
    
    private func configureLabels() {
        dateLabel.text = stock.date
        openLabel.text = "Open: $\(String(format: "%.2f", stock.open))"
        closeLabel.text = "Close: $\(String(format: "%.2f", stock.close))"
    }
    
    private func loadImage() {
        if stock.didStockProfit(open: stock.open, close: stock.close) {
            stockImage.image = UIImage(named: "thumbsUp")
        } else {
            stockImage.image = UIImage(named: "thumbsDown")
        }

    }

    private func updateBackgroundColor() {
        if stock.didStockProfit(open: stock.open, close: stock.close) {
            self.view.backgroundColor = UIColor.green
        } else {
            self.view.backgroundColor = UIColor.red
        }
    }
}
