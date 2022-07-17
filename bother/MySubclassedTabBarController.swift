//
//  MySubclassedTabBarController.swift
//  bother
//
//  Created by Eyüp Mert on 16.07.2022.
//

import Foundation
import UIKit

class MySubclassedTabBarController: UITabBarController {

    override func viewDidLoad() {
      super.viewDidLoad()
      delegate = self
        
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        
      //  checkVIP();
    }
    
 
    /*
    func checkVIP(){
        Purchases.shared.getCustomerInfo { (purchaserInfo, error) in
            if let purchaserInfo = purchaserInfo{
                print("gelen subs \(purchaserInfo)")
                if !purchaserInfo.entitlements.active.isEmpty {
                    print("vip üye oldu");
                    isVipMember = true;
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "becomeVIP"), object: nil, userInfo: nil);
                }
            }
        }
    }
     */
    
}

extension MySubclassedTabBarController: UITabBarControllerDelegate  {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
           animateTabBarChange(tabBarController: tabBarController, to: viewController)
           return true
       }
    
}
