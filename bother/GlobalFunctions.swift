//
//  GlobalFunctions.swift
//  bother
//
//  Created by Eyüp Mert on 15.07.2022.
//

import Foundation
import UIKit
import FirebaseAuth



extension UIViewController {
    
    func animateTabBarChange(tabBarController: UITabBarController, to viewController: UIViewController) {
        let fromView: UIView = tabBarController.selectedViewController!.view
        let toView: UIView = viewController.view
        
        
        // do whatever animation you like
        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.5, options: [.transitionCrossDissolve], completion: nil)
        }
    }
    
    func openCategoryPage(){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
        let vc: CategoryViewController = storyboard.instantiateViewController(withIdentifier: "CategoryViewControllerID") as! CategoryViewController;
        
        vc.modalPresentationCapturesStatusBarAppearance = true
        vc.modalPresentationStyle = .overFullScreen;
        
        self.present(vc, animated: true, completion: nil);
    }
    
    func openSelectedCategory(selectedMainCategory: Int){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
        let vc: SelectedCategoryViewController = storyboard.instantiateViewController(withIdentifier: "SelectedCategoryViewControllerID") as! SelectedCategoryViewController;
        
        vc.modalPresentationCapturesStatusBarAppearance = true
        vc.modalPresentationStyle = .overFullScreen;
        vc.selectedMainCategory = selectedMainCategory;
        
        self.present(vc, animated: true, completion: nil);
    }
    
    func openSignUpViewController(selectedMainCategory: Int){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
        let vc: SignUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewControllerID") as! SignUpViewController;
        
        vc.modalPresentationCapturesStatusBarAppearance = true
        vc.modalPresentationStyle = .overFullScreen;
        vc.selectedMainCategory = selectedMainCategory

        self.present(vc, animated: true, completion: nil);
    }
    
    func openSignInViewController(selectedMainCategory: Int){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
        let vc: SignInViewController = storyboard.instantiateViewController(withIdentifier: "SignInViewControllerID") as! SignInViewController;
        
        vc.modalPresentationCapturesStatusBarAppearance = true
        vc.modalPresentationStyle = .overFullScreen;
        vc.selectedMainCategory = selectedMainCategory
        
        self.present(vc, animated: true, completion: nil);
    }
    
    func openWriteYourStoryPage() {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
        let vc: WriteOwnStoryViewController = storyboard.instantiateViewController(withIdentifier: "WriteOwnStoryViewControllerID") as! WriteOwnStoryViewController;
        
        vc.modalPresentationCapturesStatusBarAppearance = true
        vc.modalPresentationStyle = .overFullScreen;
        
        self.present(vc, animated: true, completion: nil);
    }
    
    
    
}


extension NSObject{
    
    func runAfterDelay(_ delay: TimeInterval, block: @escaping ()->()) {
        let time = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time, execute: block)
    }
}



extension String {
    var isValidEmail: Bool {
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
        return testEmail.evaluate(with: self)
    }
    var isValidPhone: Bool {
        let regularExpressionForPhone = "^\\d{3}-\\d{3}-\\d{4}$"
        let testPhone = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPhone)
        return testPhone.evaluate(with: self)
    }
}
