//
//  ViewController.swift
//  AERecordDemo
//
//  Created by sotsys-236 on 23/08/19.
//  Copyright © 2019 sotsys-236. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    var userDataModel = UserDataModel.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0...3000{
            let userDataModel = UserDataModel()
            userDataModel.User_Gender = "Female"
            userDataModel.User_Email = "xyz@gmail.com"
            userDataModel.User_Id = "\(i)"
            userDataModel.User_Name = "xyz"
            DBHelper.insertUserData(userDataModel: userDataModel)
        }
      

//        DBHelper.getUsersData()
        let arrUserAll = DBHelper.getAllUserData()
        print(arrUserAll.count)
        print("arrUserAll Count = \(arrUserAll.count)")

        let arrUserByID = DBHelper.getUserByID(userId: "123")
        print("arrUserByID Count = \(arrUserByID.count)")
        print("arrUserByID Name = \(arrUserByID[0].name!)")

        let arrUserBySort = DBHelper.getUserBySorting()
        print("arrUserBySort Count = \(arrUserBySort.count)")
        print("arrUserBySort Name = \(arrUserBySort[0].name!)")

    }
}

