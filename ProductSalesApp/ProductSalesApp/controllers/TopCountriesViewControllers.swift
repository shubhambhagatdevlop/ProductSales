//
//  TopCountriesViewControllers.swift
//  ProductSalesApp
//
//  Created by Shubham Bhagat on 28/06/21.
//

import UIKit

class TopCountriesViewControllers: UIViewController {
    
    @IBOutlet weak var productName: UILabel!
    var productCode = ""
    var prodArr = [ProductModel]()
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var totalSales: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productName.text = "Product Name : \(productCode)"
        self.manipulateProdData()
        // Do any additional setup after loading the view.
    }
    func manipulateProdData(){
        
        var dict = [String:Int]()
        for prods in self.prodArr {
            if let item = dict["\(prods.prod ?? "")_\(prods.country ?? "")"] {
                dict["\(prods.prod ?? "")_\(prods.country ?? "")"] = item + (prods.price ?? 0)
            } else {
                dict["\(prods.prod ?? "")_\(prods.country ?? "")"] = prods.price ?? 0
            }
        }
        print(dict)
        let newDict = dict.sorted(by: {
            $0.1 > $1.1
        })
        if let index = newDict.firstIndex(where: {$0.key.contains("\(productCode)_")}) {
            print("c:\(newDict[index].key.components(separatedBy: "_").last ?? "") , total:\(newDict[index].value)")
            self.countryName.text = newDict[index].key.components(separatedBy: "_").last ?? ""
            self.totalSales.text = "Total Sales: \(newDict[index].value)"
        }
    }
}
