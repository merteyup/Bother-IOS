//
//  ProfilePageCell.swift
//  bother
//
//  Created by Eyüp Mert on 17.07.2022.
//

import UIKit


protocol SignUpPageCell1Delegate: AnyObject {
    func signUpClicked()
}


class SignUpPageCell1: UITableViewCell {
    
    // MARK: - Variables
    weak var signUpPageCell1Delegate: SignUpPageCell1Delegate?
    
    // MARK: - Outlets
    @IBOutlet weak var loginImage: UIImageView!
    @IBOutlet weak var headerSignUp: UILabel!
    @IBOutlet weak var lblConvince: UILabel!
   // @IBOutlet weak var btnGoogle: UIButton!
  //  @IBOutlet weak var btnFacebook: UIButton!
  //  @IBOutlet weak var btnApple: UIButton!
  //  @IBOutlet weak var lblOr: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    // MARK: - Statements
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Actions
    @IBAction func btnSignUpClicked(_ sender: Any) {
        signUpPageCell1Delegate?.signUpClicked()
    }
    
}
