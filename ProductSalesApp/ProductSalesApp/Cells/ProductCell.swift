//
//  ProductCell.swift
//  ProductSalesApp
//
//  Created by Shubham Bhagat on 28/06/21.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var topCountries: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
