//
//  ColorgySetupProfileViewController.swift
//  ColorgyTimeTable
//
//  Created by David on 2015/4/27.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class ColorgySetupProfileViewController: UIViewController {
    
    var colorgyGreen: UIColor = UIColor(red: 42/255.0, green: 171/255.0, blue: 147/255.0, alpha: 1)
    var colorgyYellow: UIColor = UIColor(red: 1, green: 1, blue: 0, alpha: 1)
    
    var profilePhoto: UIImageView!
    
    var userName, userPhone, userSchool: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // upper patches of profile
        var upperpatches = UIView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height * 0.36))
        upperpatches.backgroundColor = self.colorgyGreen
        
        self.view.addSubview(upperpatches)
        
        // profile image
        var profilePhtotHeight = self.view.frame.width * 0.3
        profilePhoto = UIImageView(frame: CGRectMake(0, 0, profilePhtotHeight, profilePhtotHeight))
        profilePhoto.layer.borderColor = self.colorgyYellow.CGColor
        profilePhoto.layer.borderWidth = 3
        profilePhoto.layer.cornerRadius = profilePhtotHeight / 2
        profilePhoto.backgroundColor = UIColor.grayColor()
        profilePhoto.center = CGPointMake(self.view.frame.width / 2, upperpatches.frame.height)
        profilePhoto.image = UIImage(named: "profile.jpg")
        profilePhoto.layer.masksToBounds = true
        
        self.view.addSubview(profilePhoto)
        
        // add text field to user
        userName = UITextField(frame: CGRectMake(0, 0, self.view.frame.width*0.8, 30))
        userName.layer.borderWidth = 1
        userName.layer.borderColor = UIColor.grayColor().CGColor
        userName.layer.cornerRadius = 3
        userName.placeholder = "name"
        userName.borderStyle = UITextBorderStyle.RoundedRect
        userName.center = CGPointMake(self.view.center.x, self.view.center.y)
        self.view.addSubview(userName)
        
        userPhone = UITextField(frame: CGRectMake(0, 0, self.view.frame.width*0.8, 30))
        userPhone.layer.borderWidth = 1
        userPhone.layer.borderColor = UIColor.grayColor().CGColor
        userPhone.layer.cornerRadius = 3
        userPhone.placeholder = "phone"
        userPhone.borderStyle = UITextBorderStyle.RoundedRect
        userPhone.center = CGPointMake(self.view.center.x, self.view.center.y+60)
        self.view.addSubview(userPhone)
        
        userSchool = UITextField(frame: CGRectMake(0, 0, self.view.frame.width*0.8, 30))
        userSchool.layer.borderWidth = 1
        userSchool.layer.borderColor = UIColor.grayColor().CGColor
        userSchool.layer.cornerRadius = 3
        userSchool.placeholder = "school"
        userSchool.borderStyle = UITextBorderStyle.RoundedRect
        userSchool.center = CGPointMake(self.view.center.x, self.view.center.y+120)
        self.view.addSubview(userSchool)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
