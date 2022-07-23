//
//  CurrentUser.swift
//  bother
//
//  Created by Eyüp Mert on 16.07.2022.
//

import Foundation
import FirebaseAuth

class BotherUser {
    
    // Uid, App version, isvipmember
    
    //MARK: - Variables
    private var appVersion : String?
    private var authMethod : Int?
    private var country : String?
    private var device : Int?
    private var email : String?
    private var emailAllowed : Bool?
    private var firebaseUID : String?
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
}


