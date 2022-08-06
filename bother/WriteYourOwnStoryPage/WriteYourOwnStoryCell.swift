//
//  WriteYourOwnStoryCellID.swift
//  bother
//
//  Created by Eyüp Mert on 19.07.2022.
//

import UIKit
import FirebaseAuth


protocol WriteYourOwnStoryCellDelegate : AnyObject {
    
    func sendPressed(bother: Bother)
    
}

class WriteYourOwnStoryCell: UITableViewCell, UITextViewDelegate{
   
    
    @IBOutlet weak var headerOwnStory: UILabel!
    @IBOutlet weak var txtYourOwnStory: UITextView!
    @IBOutlet weak var txtBackgroundView: ViewBackgroundFWriteStory!
    @IBOutlet weak var pickerViewCategory: UIPickerView!
    @IBOutlet weak var txtRemainingChar: UILabel!
    
    @IBOutlet weak var btnSend: ButtonBackground!
    var pickerData: Array<String>!
    weak var writeYourOwnStoryCellDelegate : WriteYourOwnStoryCellDelegate!
    var currentBother = Bother(createdAt: nil, botherCategory: nil, botherOwner: nil, botherText: nil, botherTitle: nil, botherAnswer: nil, agreedPerson: nil, disagreedPerson: nil, isVisible: nil)
    var maxLength = 200
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.pickerViewCategory.delegate = self;
        self.pickerViewCategory.dataSource = self;
        txtRemainingChar.text = String(maxLength)

        UILabel.animate(withDuration: 1.2) {
            self.headerOwnStory.alpha = 1
        }

        runAfterDelay(2) {
            UIView.animate(withDuration: 1.5) {
                self.txtBackgroundView.alpha = 1
            }
        }
        
        runAfterDelay(5) {
            UIPickerView.animate(withDuration: 1.5) {
                self.pickerViewCategory.alpha = 1
            }
        }
        
        runAfterDelay(6) {
            UIButton.animate(withDuration: 1.5) {
                self.btnSend.alpha = 1
            }
        }
        
        
        self.txtYourOwnStory.delegate = self

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func actionSendYourStory(_ sender: Any) {
        
        print("Send pressed")

        if self.txtYourOwnStory.text != "" {
            if currentBother.botherTitle != nil &&
                currentBother.botherText != nil &&
                currentBother.botherCategory != nil &&
                Auth.auth().currentUser != nil {
                writeYourOwnStoryCellDelegate.sendPressed(bother: currentBother)
            }
        }
        botherArray = loremIpsum.components(separatedBy: ["!", ".", "?"])
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        currentBother.botherTitle = "Example Title"
        currentBother.botherText = textView.text
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
       
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        txtYourOwnStory.text = ""
        self.txtRemainingChar.alpha = 1
    }
    
  
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        txtRemainingChar.text = "\(maxLength - textView.text.count)"

        return txtYourOwnStory.text.count + (text.count - range.length) <= maxLength
    }
    
}




extension WriteYourOwnStoryCell:  UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return categoryArray[row]
       }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentBother.botherCategory = row
    }

    
}
