//
//  SelectedCategoryViewController.swift
//  bother
//
//  Created by Eyüp Mert on 15.07.2022.
//

import UIKit
import FirebaseAuth
import SCLAlertView
import GoogleMobileAds

class SelectedCategoryViewController: UIViewController {
    
    
    // TODO: Can be anything without violence, sex, terrorism, etc.
    
    // MARK: - Variables
    var selectedMainCategory : Int = 0
    var isDailyBotherFinished = false
    var botherObjectArray = [Bother]()
    var answeredBothersArray = [Bother]()
    private var interstitial: GADInterstitialAd?

    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnWrite: UIButton!
    
    
    // MARK: - Actions
    @IBAction func actionDismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func actionWrite(_ sender: Any) {
        openWriteYourStoryPage(viewController: nil)
    }
    
    
    @IBAction func btnResetDailyBother(_ sender: Any) {
        DispatchQueue.main.async {
            self.openWriteYourStoryPage(viewController: self)
        }
        if Auth.auth().currentUser == nil {
            openSignUpViewController(selectedMainCategory: selectedMainCategory)
        } else {
            openWriteYourStoryPage(viewController: self)
        }
    }
 
 
    // MARK: - Statements
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationObservers()
    }
    
  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getBothersFromDB()
        requestAd ()
    }
    
    // MARK: - Functions
    
    fileprivate func notificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.showSuccessView), name: NSNotification.Name(rawValue: "newUserCreated"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.showSuccessView), name: NSNotification.Name(rawValue: "userSignedIn"), object: nil)
    }
    
    func getBothersFromDB() {

        botherArray = loremIpsum.components(separatedBy: ["!", ".", "?"])
        botherObjectArray.removeAll()
        for index in botherArray {
            let newBother = Bother(botherOwner: Auth.auth().currentUser != nil ? Auth.auth().currentUser!.uid : "RandomUser",
                                   botherText: index,
                                   botherAnswer: nil)
            botherObjectArray.append(newBother)
            print("BotherOBjArr: \(botherObjectArray)")
        }
        
        self.tableView.reloadData()
        
    }
    
    @objc func showSuccessView() {
        DispatchQueue.main.async {
          //  "main.Spend*some*time*here".l10n()
            SCLAlertView().showInfo("main.Spend*some*time*here".l10n(), subTitle: "You are great")
        }
    }
    
    func requestAd () {
        // MARK: TODO Change test id to normal one.
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                               request: request,
                               completionHandler: { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            interstitial = ad
            interstitial?.fullScreenContentDelegate = self
        })
    }
    
    fileprivate func showAd() {
        if self.interstitial != nil {
            self.interstitial?.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }
    
    
}


// MARK: - Extensions




extension SelectedCategoryViewController: UITableViewDelegate, ActionYesOrNoDelegate {
    
    func actionYesOrNoClicked(answer: Int) {

    }
        
    func actionYesOrNoClicked(cell: SelectedCategoryTableViewCell) {
        if let indexPath = self.tableView.indexPath(for: cell){
            if botherArray.count > 0 {
              //  botherArray.remove(at: indexPath.row - 1)
                if let dailyBotherLimit = BotherUser.shared.getSessionBotherLimit() {
                    BotherUser.shared.setSessionBotherLimit(sessionBotherLimit: dailyBotherLimit - 1)
                    if dailyBotherLimit == 1 {
                        isDailyBotherFinished = true

                        let appearance = SCLAlertView.SCLAppearance(
                            showCloseButton: false
                        )
                        var alertView = SCLAlertView(appearance: appearance)
                        alertView.addButton("main.Watch*Ad".l10n()) {
                            self.showAd()
                        }
                        alertView.addButton("main.Write*Something".l10n()) {
                            self.openWriteYourStoryPage(viewController: self)
                        }
                        
                        DispatchQueue.main.async {
                            alertView.showCustom("main.Daily*Limit*Achieved".l10n(), subTitle: "main.Write*a*story*or".l10n(), color: .green, icon: (UIImage(systemName: "shareplay")  ?? UIImage(systemName: "pencil"))!)
                        }
                    }
                    
                }
            } else {
                isDailyBotherFinished = true
            }
        }
    }
    
    
  
    
}


extension SelectedCategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if BotherUser.shared.getSessionBotherLimit() != 0 {
            return botherArray.count + 1
        } else {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            
            if BotherUser.shared.getSessionBotherLimit() != 0 {
                
                return 0

            } else {
                return UITableView.automaticDimension
            }
        } else {
            return UITableView.automaticDimension
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DailyLimitAchievedTableViewCellID", for: indexPath) as! DailyLimitAchievedTableViewCell
            if Auth.auth().currentUser == nil {
                cell.headerAchievedLmt.text = "main.Sign*up*and*become".l10n()
            } else {
                cell.headerAchievedLmt.text = "main.Write*your*own".l10n()
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedCategoryTableViewCellID", for: indexPath) as! SelectedCategoryTableViewCell
            cell.actionYesOrNoDelegate = self

            prepareButtonCall(cell, indexPath)
            cell.updateCell(botherObject: botherObjectArray[indexPath.row - 1])
            
            return cell
        }
    }
    
    @objc func btnNoHandler(sender:UIButton) {
        
        let selectedIndexpath = sender.tag
            botherObjectArray[selectedIndexpath - 1].botherAnswer = false
            answeredBothersArray.append(botherObjectArray[selectedIndexpath - 1])
            self.tableView.reloadData()
        // TODO: Write new array to the database
        print("AnsweredBothersArray: \(answeredBothersArray)")
        }
    
    @objc func btnMeTooHandler(sender:UIButton) {
            let selectedIndexpath = sender.tag
            botherObjectArray[selectedIndexpath - 1].botherAnswer = true
            answeredBothersArray.append(botherObjectArray[selectedIndexpath - 1])
            self.tableView.reloadData()
        print("AnsweredBothersArray: \(answeredBothersArray)")
        // TODO: Write new array to the database
        }
    
    fileprivate func prepareButtonCall(_ cell: SelectedCategoryTableViewCell, _ indexPath: IndexPath) {
        cell.btnNo.tag = indexPath.row
        cell.btnNo.addTarget(self,action:#selector(btnNoHandler(sender:)), for: .touchUpInside)
        cell.btnMeToo.tag = indexPath.row
        cell.btnMeToo.addTarget(self,action:#selector(btnMeTooHandler(sender:)), for: .touchUpInside)
    }
    
}


extension SelectedCategoryViewController: WriteOwnStoryViewControllerDelegate {
    func newStorySendPressed() {
        DispatchQueue.main.async {
            self.getBothersFromDB()
        }
    }
}

extension SelectedCategoryViewController : GADFullScreenContentDelegate {
    
    /// Tells the delegate that the ad failed to present full screen content.
     func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
       print("Ad did fail to present full screen content.")
     }

     /// Tells the delegate that the ad will present full screen content.
     func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
       print("Ad will present full screen content.")
     }

     /// Tells the delegate that the ad dismissed full screen content.
     func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
       print("Ad did dismiss full screen content.")
         BotherUser.shared.setSessionBotherLimit(sessionBotherLimit: 10)
         isDailyBotherFinished = false
         tableView.reloadData()
     }
    
    
    
}
