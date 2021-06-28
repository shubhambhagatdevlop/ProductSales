//
//  ProductModel.swift
//  ProductSalesApp
//
//  Created by Shubham Bhagat on 28/06/21.
//

import Foundation

class ProductModel: NSObject {
    
    var prod: String?
    var country: String?
    var price: Int?
    
    required public init(dict:[String:Any]) {
        self.prod = dict["prod"] as? String ?? ""
        self.country = dict["country"] as? String ?? ""
        self.price = dict["price"] as? Int ?? 0
    }
}
