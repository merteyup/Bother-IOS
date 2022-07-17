//
//  SignInPageCell1.swift
//  bother
//
//  Created by Eyüp Mert on 17.07.2022.
//

import UIKit


protocol SignInPageCell1Delegate: AnyObject {
    
    func signInClicked()
    func resetPasswordClicked()
    func googleSignInClicked()
}

class SignInPageCell1: UITableViewCell {
    
    // MARK: - Variables
    weak var signInPageCell1Delegate : SignInPageCell1Delegate?
    
    // MARK: - Outlets
    @IBOutlet weak var imgSignIn: UIImageView!
    @IBOutlet weak var headerSignIn: UILabel!
    @IBOutlet weak var emailSignIn: UITextField!
    @IBOutlet weak var passwordSignIn: UITextField!
    @IBOutlet weak var btnForgot: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
  //  @IBOutlet weak var lblOr: UILabel!
   // @IBOutlet weak var btnGoogle: UIButton!
   // @IBOutlet weak var btnFacebook: UIButton!
   // @IBOutlet weak var btnApple: UIButton!
    @IBOutlet weak var goToRegister: UILabel!
    
        // MARK: - Statements
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Actions

    @IBAction func btnSignInClicked(_ sender: Any) {
        signInPageCell1Delegate?.signInClicked()
    }
    
    @IBAction func btnForgotPassword(_ sender: Any) {
        signInPageCell1Delegate?.resetPasswordClicked()
    }
    
    
    @IBAction func btnGoogleSignIn(_ sender: Any) {
        signInPageCell1Delegate?.googleSignInClicked()
    }
    
}
