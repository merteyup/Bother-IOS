//
//  WriteYourOwnStoryCellID.swift
//  bother
//
//  Created by Eyüp Mert on 19.07.2022.
//

import UIKit


protocol WriteYourOwnStoryCellDelegate : AnyObject {
    
    func sendPressed()
    
}

class WriteYourOwnStoryCell: UITableViewCell, UITextViewDelegate{
   
    
    @IBOutlet weak var headerOwnStory: UILabel!
    @IBOutlet weak var txtYourOwnStory: UITextView!
    @IBOutlet weak var txtBackgroundView: ViewBackgroundFWriteStory!
    @IBOutlet weak var pickerViewCategory: UIPickerView!
    
    
    @IBOutlet weak var btnSend: ButtonBackground!
    var pickerData: Array<String>!
    weak var writeYourOwnStoryCellDelegate : WriteYourOwnStoryCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.pickerViewCategory.delegate = self;
        self.pickerViewCategory.dataSource = self;


        UILabel.animate(withDuration: 1.5) {
            self.headerOwnStory.alpha = 1
        }

        runAfterDelay(3) {
            UIView.animate(withDuration: 2) {
                self.txtBackgroundView.alpha = 1
            }
        }
        
        runAfterDelay(6) {
            UIPickerView.animate(withDuration: 2) {
                self.pickerViewCategory.alpha = 1
            }
        }
        
        runAfterDelay(7) {
            UIButton.animate(withDuration: 2) {
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
        writeYourOwnStoryCellDelegate.sendPressed()
        if self.txtYourOwnStory.text != "" {
            UserDefaults.standard.set(self.txtYourOwnStory.text, forKey: "currentStory")
        }
        botherArray = loremIpsum.components(separatedBy: ["!", ".", "?"])
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        txtYourOwnStory.text = ""
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
    

    
}
