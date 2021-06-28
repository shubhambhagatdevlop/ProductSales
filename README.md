# ProductSales
productSalesAlgo


Please Check TopCountriesViewController's manipulateProdData() method to get the Algoritm of this code
Time Complexity O(n)

        var dict = [String:Int]()
        for prods in self.prodArr {
            if let item = dict["\(prods.prod ?? "")_\(prods.country ?? "")"] {
                dict["\(prods.prod ?? "")_\(prods.country ?? "")"] = item + (prods.price ?? 0)
            } else {
                dict["\(prods.prod ?? "")_\(prods.country ?? "")"] = prods.price ?? 0
            }
        }
        let newDict = dict.sorted(by: {
            $0.1 > $1.1
        })
        if let index = newDict.firstIndex(where: {$0.key.contains("\(productCode)_")}) {
            print("c:\(newDict[index].key.components(separatedBy: "_").last ?? "") , total:\(newDict[index].value)")
        }
    }
