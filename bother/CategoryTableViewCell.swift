//
//  CategoryTableViewCell.swift
//  bother
//
//  Created by Eyüp Mert on 15.07.2022.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryBotherCount: UILabel!
    @IBOutlet weak var categoryReaderCount: UILabel!
    @IBOutlet weak var categoryIcon: UIImageView!
    
    // MARK: - Statements
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
