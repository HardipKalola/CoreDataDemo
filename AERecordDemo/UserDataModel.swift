//
//  UserModel.swift
//  AERecordDemo
//
//  Created by sotsys-236 on 23/08/19.
//  Copyright © 2019 sotsys-236. All rights reserved.
//

import Foundation
class UserDataModel {
    
    var User_Email:String = ""
    var User_Gender:String = ""
    var User_Name:String = ""
    var User_Id:String = ""

    init()
    {
    }
    
    static var sharedInstance = UserDataModel()
    func clearSharedInsrtance(){
        self.User_Email = ""
        self.User_Gender = ""
        self.User_Name = ""
        self.User_Id = ""
    }
    
    func printInstance(){
        print("\n User_Email = \(User_Email)\n")
        print(" User_Gender = \(User_Gender)\n")
        print(" User_Name = \(User_Name)\n")
        print("User_Id = \(User_Id)\n")
    }
}

