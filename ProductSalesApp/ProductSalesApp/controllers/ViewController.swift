//
//  ViewController.swift
//  ProductSalesApp
//
//  Created by Shubham Bhagat on 28/06/21.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    
    
    var prodArr = [ProductModel]()
    var productSetArr = [String]() {
        didSet {
            self.mainTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        
        
        
        if let path = Bundle.main.path(forResource: "input_ios", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                  if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let sales = jsonResult["sales"] as? NSArray {
                    for item in sales {
                        if let dict = item as? [String:Any] {
                            self.prodArr.append(ProductModel.init(dict: dict))
                        }
                    }
                    self.manipulateProdData()
                    
                  }
              } catch {
                print(error)
              }
        }
    }
    
    func manipulateProdData(){
        
         var arr = [String]()
        self.prodArr.forEach({
            arr.append($0.prod ?? "")
        })
        productSetArr = Array(Set(arr)).sorted(by: {$0 < $1})
       
//        var dict = [String:Int]()
//        for prods in self.prodArr {
//            if let item = dict["\(prods.prod ?? "")_\(prods.country ?? "")"] {
//                dict["\(prods.prod ?? "")_\(prods.country ?? "")"] = item + (prods.price ?? 0)
//            } else {
//                dict["\(prods.prod ?? "")_\(prods.country ?? "")"] = prods.price ?? 0
//            }
//        }
//        print(dict)
//        let search = "A"
//        let newDict = dict.sorted(by: {
//            $0.1 > $1.1
//        })
//        if let index = newDict.firstIndex(where: {$0.key.contains("\(search)_")}) {
//            print("c:\(newDict[index].key.components(separatedBy: "_").last ?? "") , total:\(newDict[index].value)")
//        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productSetArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductCell
        cell.productName.text = "Product Name: \(self.productSetArr[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TopCountriesViewControllers") as! TopCountriesViewControllers
        controller.productCode = self.productSetArr[indexPath.row]
        controller.prodArr = self.prodArr
        self.present(controller, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}


