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
    
    @IBOutlet weak var foregroundGrey: UIView!
    
    // MARK: - Outlets
    @IBOutlet weak var selectedCategoryTitle: UILabel!
    @IBOutlet weak var selectedcategoryBotherAgreed: UILabel!
    @IBOutlet weak var selectedcategoryReaderDisagreed: UILabel!
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

    func updateCell(botherObject: Bother) {
        
        selectedCategoryTitle.text = botherObject.botherText
        if let botherAnswer = botherObject.botherAnswer {
            
            // TODO: Get values for selected bother from database and show them in here correctly.
            self.selectedcategoryBotherAgreed.alpha = 1
            selectedcategoryBotherAgreed.text = String(botherObject.botherAnswer!)
            self.selectedcategoryReaderDisagreed.alpha = 1
            selectedcategoryReaderDisagreed.text = String(botherObject.botherAnswer!)
            self.isUserInteractionEnabled = false
            foregroundGrey.alpha = 1

        }
        
    }
    
    
    override func prepareForReuse() {
        selectedcategoryBotherAgreed.alpha = 0
        selectedcategoryBotherAgreed.text = ""
        selectedcategoryReaderDisagreed.alpha = 0
        selectedcategoryReaderDisagreed.text = ""
        self.isUserInteractionEnabled = true
        foregroundGrey.alpha = 0

    }
}
