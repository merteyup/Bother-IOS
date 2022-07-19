//
//  ViewBackgroundFWriteStory.swift
//  bother
//
//  Created by Eyüp Mert on 19.07.2022.
//

import Foundation
import UIKit



class ViewBackgroundFWriteStory: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadiusAndShadow()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setRadiusAndShadow()
    }
    func setRadiusAndShadow(){
        
        clipsToBounds = true
        layer.masksToBounds = false
        layer.cornerRadius = 10
        layer.shadowRadius = 0.5
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
}
