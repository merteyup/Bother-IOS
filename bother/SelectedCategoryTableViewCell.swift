//
//  SelectedCategoryTableViewCell.swift
//  bother
//
//  Created by Eyüp Mert on 15.07.2022.
//

import UIKit


// NOTE: Sends selected cell itself and also selected answer to the controller.
protocol ActionYesOrNoDelegate: AnyObject {
   func actionYesOrNoClicked(cell: SelectedCategoryTableViewCell)
   func actionYesOrNoClicked(answer: Int)
}

class SelectedCategoryTableViewCell: UITableViewCell {
    
    // MARK: - Variables
    weak var actionYesOrNoDelegate: ActionYesOrNoDelegate?
    
    // MARK: - Outlets
    @IBOutlet weak var selectedCategoryTitle: UILabel!
    @IBOutlet weak var selectedcategoryBotherCount: UILabel!
    @IBOutlet weak var selectedcategoryReaderCount: UILabel!
    @IBOutlet weak var btnMeToo: UIButton!
    @IBOutlet weak var btnNo: UIButton!
        
    // MARK: - Actions
    @IBAction func btnYesOrNoClicked(sender: UIButton) {
          //4. call delegate method
          //check delegate is not nil with `?`
        actionYesOrNoDelegate?.actionYesOrNoClicked(cell: self)
        actionYesOrNoDelegate?.actionYesOrNoClicked(answer: sender.tag)
      }
    
    // MARK: - Statements
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
}
