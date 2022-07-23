//
//  CurrentUser.swift
//  bother
//
//  Created by Eyüp Mert on 16.07.2022.
//

import Foundation
import FirebaseAuth
import L10n_swift
import FirebaseFunctions

class BotherUser {
    
    // Uid, App version, isvipmember
    
    //MARK: - Variables
    private var appVersion : String?
    // Auth methods: 0: E-mail,password. 1: Magic link. 2. Facebook. 3. Apple
    private var authMethod : Int?
    private var country : String?
    private var device : Int?
    private var email : String?
    private var emailAllowed : Bool?
    private var firebaseUID : String?
    // UserRoles: 0: Owners, 1: Admins, 2: Standart Users
    private var userRole : Int?
    private var isVipMember : Bool?
    private var language : String?
    private var name : String?
    private var totalBotherCount : Int?
    private var oneSignalId : String?
    private var sessionStarted : Int?
    private var surname : String?
    private var createdAt : Double?
    private var isSuspended : Bool?
    private var isSawWriteStoryPage : Bool?
    private var sessionBotherLimit : Int = 10
    private var gender : Int?
    
    
    // deviceType => 0-iOS, 1-Android, -1 YOK
    // authMethod => 0-Anon, 1-Facebook, 2-Apple, 3-EMail
    
    
    static let shared = BotherUser()
    
    private init() {}
    
    // MARK: Getter - Setter
    func getAppVersion() -> String?{
        return appVersion}
    
    func setAppVersion(appVersion: String?){
        self.appVersion = appVersion;
    }
    //----
    func getAuthMethod() -> Int?{
        return authMethod}
    
    func setAuthMethod(authMethod: Int?){
        self.authMethod = authMethod;
    }
    //----
    func getCountry() -> String?{
        return country}
    
    func setCountry(country: String?){
        self.country = country;
    }
    //----
    func getDevice() -> Int?{
        return device}
    
    func setDevice(device: Int?){
        self.device = device;
    }
    //----
    func getEmail() -> String?{
        return email}
    
    func setEmail(email: String?){
        self.email = email;
    }
    //----
    func getEmailAllowed() -> Bool?{
        return emailAllowed}
    
    func setEmailAllowed(emailAllowed: Bool?){
        self.emailAllowed = emailAllowed;
    }
    //----
    func getFirebaseUID() -> String?{
        return firebaseUID}
    
    func setFirebaseUID(firebaseUID: String?){
        self.firebaseUID = firebaseUID;
    }
    //----
    func getIsVipMember() -> Bool?{
        return isVipMember}
    
    func setIsVipMember(isVipMember: Bool?){
        self.isVipMember = isVipMember;
    }
    //----
    func getLanguage() -> String?{
        return language}
    
    func setLanguage(language: String?){
        self.language = language;
    }
    //----
    func getName() -> String?{
        return name}
    
    func setName(name: String?){
        self.name = name;
    }
    //----
    func getOneSignalId() -> String?{
        return oneSignalId}
    
    func setOneSignalId(oneSignalId: String?){
        self.oneSignalId = oneSignalId;
    }
    //----
    func getUserRole() -> Int?{
        return userRole}
    
    func setUserRole(userRole: Int?){
        self.userRole = userRole;
    }
    //----
    func getSessionStarted() -> Int?{
        return sessionStarted}
    
    func setSessionStarted(sessionStarted: Int?){
        self.sessionStarted = sessionStarted;
    }
    //----
    func getSurname() -> String?{
        return surname}
    
    func setSurname(surname: String?){
        self.surname = surname;
    }
    //----
    
    func getIsSuspended() -> Bool?{
        return isSuspended}
    
    func setIsSuspended(isSuspended: Bool?){
        self.isSuspended = isSuspended;
    }
    
    //----
    func getCreatedAt() -> Double?{
        return createdAt}
    
    func setCreatedAt(createdAt: Double?){
        self.createdAt = createdAt;
    }
    //----
    func getSessionBotherLimit() -> Int?{
        return sessionBotherLimit}
    
    func setSessionBotherLimit(sessionBotherLimit: Int){
        self.sessionBotherLimit = sessionBotherLimit;
    }
    //----
    func getIsSawWriteStoryPage() -> Bool?{
        return isSawWriteStoryPage}
    
    func setIsSawWriteStoryPage(isSawWriteStoryPage: Bool){
        self.isSawWriteStoryPage = isSawWriteStoryPage;
    }
    //----
    func getTotalBotherCount() -> Int?{
        return totalBotherCount}
    
    func setTotalBotherCount(totalBotherCount: Int?){
        self.totalBotherCount = totalBotherCount;
    }
    //----
    func getGender() -> Int?{
        return gender}
    
    func setGender(gender: Int?){
        self.gender = gender;
    }
    
    
    
    func checkIsUserLogin() {
        print("checkIsUserLoginWorked")
        if Auth.auth().currentUser != nil {
            setSessionBotherLimit(sessionBotherLimit: 30)
        }
    }
    
    
    //MARK: - createUpdateUser - START
    static func createUpdateUser(completionHandler:@escaping (Bool) -> ()) {
        
        if let currentUser = Auth.auth().currentUser{
            //send this to our server
            var parameters = ["firebaseUID": currentUser.uid,
                              "appVersion": 1,
                              "language": L10n.shared.language,
                              "isVipMember" : false]
            
            as [String : Any];
            if let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String{
                parameters.updateValue(appVersion, forKey: "appVersion");
            }
            
            if let authMethod = BotherUser.shared.getAuthMethod(){
                parameters.updateValue(authMethod, forKey: "authMethod");
            }
            
            if let country = Locale.current.regionCode{
                parameters.updateValue(country, forKey: "country");
            }
            
            if let email = BotherUser.shared.getEmail(){
                parameters.updateValue(email, forKey: "email");
            }
            
            if let emailAllowed = BotherUser.shared.getEmailAllowed(){
                parameters.updateValue(emailAllowed, forKey: "emailAllowed");
            }
            
            if let gender = BotherUser.shared.getGender(){
                parameters.updateValue(gender, forKey: "gender");
            }
            
            if let userRole = BotherUser.shared.getUserRole(){
                parameters.updateValue(userRole, forKey: "userRole");
            }
            
            if let name = BotherUser.shared.getName() {
                parameters.updateValue(name, forKey: "name");
            }
            
            if let surname = BotherUser.shared.getSurname() {
                parameters.updateValue(surname, forKey: "surname");
            }
            
            if let isSuspended = BotherUser.shared.getIsSuspended() {
                parameters.updateValue(isSuspended, forKey: "isSuspended");
            }
            print("CreateUpdateUserParameters: \(parameters)")
            
            Functions.functions().httpsCallable("createUpdateUserProfileCloud").call(parameters) { (result, error) in
                if error == nil{
                    
                    if let resultObject = result?.data as? NSArray{
                        //  print("gelen result \(result?.data)")
                        if let success = resultObject.firstObject as? Bool{
                            if success{
                                // print("user created \(success)")
                                completionHandler(true);
                                NotificationCenter.default.post(name: Notification.Name(rawValue: "userSignedUp"), object: nil, userInfo: nil);
                            }else{
                                completionHandler(false);
                            }
                        }else{
                            completionHandler(false);
                        }
                    }
                }
            }
        }
    }
    //MARK: - createUpdateUser - END
    
    
    static func getUserInfoCloud(completionHandler:@escaping (Bool) -> ()) {
        
        if let currentUser = Auth.auth().currentUser{
            let parameters = ["firebaseUID": currentUser.uid,] as [String : Any];
            Functions.functions().httpsCallable("getUserInfoCloud").call(parameters){ (result, error) in
                if error == nil{
                    if let array = result?.data as? NSArray{
                        if let firstObject = array.firstObject{
                            if let userObject = firstObject as? [String : Any]{
                                print("gelen obje \(userObject)")
                                if (userObject["appVersion"] as? String) != nil {
                                    BotherUser.shared.setAppVersion(appVersion: userObject["appVersion"] as? String)
                                }
                                
                                if (userObject["authMethod"] as? Int) != nil {
                                    BotherUser.shared.setAuthMethod(authMethod: userObject["authMethod"] as? Int)
                                }
                                
                                if (userObject["country"] as? String) != nil {
                                    BotherUser.shared.setCountry(country: userObject["country"] as? String)
                                }
                                
                                if (userObject["device"] as? Int) != nil {
                                    BotherUser.shared.setDevice(device: userObject["device"] as? Int)
                                }
                                
                                if (userObject["email"] as? String) != nil {
                                    BotherUser.shared.setEmail(email: userObject["email"] as? String)
                                }
                                
                                if (userObject["firebaseUID"] as? String) != nil {
                                    BotherUser.shared.setFirebaseUID(firebaseUID: userObject["firebaseUID"] as? String)
                                }
                                
                                if (userObject["emailAllowed"] as? Bool) != nil {
                                    //TODO: email allowed hiç bir yerde değiştirmiyoruz
                                    BotherUser.shared.setEmailAllowed(emailAllowed: userObject["emailAllowed"] as? Bool)
                                }
                                
                                if (userObject["gender"] as? Int) != nil {
                                    BotherUser.shared.setGender(gender: userObject["gender"] as? Int)
                                }
                                
                                if (userObject["isVipMember"] as? Bool) != nil {
                                    BotherUser.shared.setIsVipMember(isVipMember: userObject["isVipMember"] as? Bool)
                                }
                                
                                if (userObject["language"] as? String) != nil {
                                    BotherUser.shared.setLanguage(language: userObject["language"] as? String)
                                }
                                
                                if (userObject["name"] as? String) != nil {
                                    BotherUser.shared.setName(name: userObject["name"] as? String)
                                }
                                
                                if (userObject["totalBotherCount"] as? Int) != nil {
                                    BotherUser.shared.setTotalBotherCount(totalBotherCount: userObject["totalBotherCount"] as? Int)
                                }
                                
                                if (userObject["surname"] as? String) != nil {
                                    BotherUser.shared.setSurname(surname: userObject["surname"] as? String)
                                }
                                
                                if (userObject["isSuspended"] as? Bool) != nil {
                                    BotherUser.shared.setIsSuspended(isSuspended: userObject["isSuspended"] as? Bool)
                                }
                                
                                if (userObject["oneSignalId"] as? String) != nil {
                                    BotherUser.shared.setOneSignalId(oneSignalId: userObject["oneSignalId"] as? String)
                                }
                                
                                if (userObject["userRole"] as? Int) != nil {
                                    BotherUser.shared.setUserRole(userRole: userObject["userRole"] as? Int)
                                }
                                
                                if (userObject["sessionStarted"] as? Int) != nil {
                                    BotherUser.shared.setSessionStarted(sessionStarted: userObject["sessionStarted"] as? Int)
                                }
                                
                                if (userObject["createdAt"] as? Double) != nil {
                                    
                                    BotherUser.shared.setCreatedAt(createdAt: userObject["createdAt"] as? Double)
                                }
                                
                                completionHandler(true);
                                
                            }
                        }
                        
                    }
                }else{
                    completionHandler(false);
                    print("hata var10 \(String(describing: error))");
                }
            }
        }else{
            completionHandler(false);
        }
    }

    
}


    

    

