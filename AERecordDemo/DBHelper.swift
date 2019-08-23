//
//  DBHelper.swift
//  AERecordDemo
//
//  Created by sotsys-236 on 23/08/19.
//  Copyright © 2019 sotsys-236. All rights reserved.

import UIKit

class DBHelper: NSObject {
    //MARK: Insert User Data To Database
    //MARK: -------
    static func insertUserData(userDataModel : UserDataModel){
        let usersData = UserTbl.create()
        usersData.email = userDataModel.User_Email
        usersData.name = userDataModel.User_Name
        usersData.id = userDataModel.User_Id
        usersData.gender = userDataModel.User_Gender
        AERecord.save()
    }
    static func getUsersData()
    {
        let UserDataDM = UserDataModel.sharedInstance
        if UserTbl.all() != nil{
            // As got user data so hide no data view and display data view
            let UserData = UserTbl.all() as! [UserTbl]
            //let UserData = TblUser.fetchAllUser() as! [TblUser]
            UserDataDM.User_Email =  UserData[0].email!
            UserDataDM.User_Name =  UserData[0].name!
            UserDataDM.User_Id =  UserData[0].id!
            UserDataDM.User_Gender =  UserData[0].gender!

        }
        else{
            // As user data not found so hide data view and display No data view
        }
        UserDataDM.printInstance()
    }
    static func getAllUserData() -> [UserTbl]
    {
        let userTbl = UserTbl.all() as! [UserTbl]
        return userTbl
    }
    static func getUserByID(userId: String) -> [UserTbl]
    {
//        let sortDescriptors = [NSSortDescriptor(key: "dateForDrink", ascending: true)]
//        let request = UserTbl.createFetchRequest(sortDescriptors: sortDescriptors)

        let predicate = NSPredicate(format: "id == %@ ",userId)
        let request = UserTbl.createFetchRequest(predicate: predicate, sortDescriptors: nil)
        // returns array of objects
        let arrUserTbl = AERecord.execute(fetchRequest: request) as! [UserTbl]
        return arrUserTbl
    }
    static func getUserBySorting() -> [UserTbl]
    {
        let sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let request = UserTbl.createFetchRequest(sortDescriptors: sortDescriptors)
        let arrUserTbl = AERecord.execute(fetchRequest: request) as! [UserTbl]
        return arrUserTbl
    }
}

