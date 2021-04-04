//
//  TransactionTableViewCell.swift
//  Spender
//
//  Created by Steve Harski on 3/30/21.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var categoryImageView: UIImageView!
    @IBOutlet private weak var transactionTitleLabel: UILabel!
    @IBOutlet private weak var transactionAmountLabel: UILabel!
    
    var categoryImage: UIImage? {
        didSet {
            categoryImageView.image = categoryImage
        }
    }
    
    var transactionTitle: String? {
        didSet {
            transactionTitleLabel.text = transactionTitle
        }
    }
    
    var transactionAmount: String? {
        didSet {
            transactionAmountLabel.text = transactionAmount
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

// MARK: - NibReusable
extension TransactionTableViewCell: NibReusable { }
