//
//  ColorgyFBLoginViewController.swift
//  ColorgyTimeTable
//
//  Created by David on 2015/4/27.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class ColorgyFBLoginViewController: UIViewController {

    var loginBackground: UIImageView!
    var colorgyLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var image = UIImage(named: "LoginBackground")
        var w = image?.size.width
        var h = image?.size.height
        loginBackground = UIImageView(frame: CGRectMake(0, 0, w!, h!))
        loginBackground.center.x = self.view.center.x
        loginBackground.image = image
        
        self.view.addSubview(loginBackground)
        
        var transformUp = CGAffineTransformMakeTranslation(0, -500)
        loginBackground.transform = transformUp
        
        // adding logo
        var logo = UIImage(named: "ColorgyLogo")
        w = logo?.size.width
        h = logo?.size.height
        colorgyLogo = UIImageView(frame: CGRectMake(0, 0, w!, h!))
        colorgyLogo.image = logo
        colorgyLogo.center.x = self.view.center.x
        colorgyLogo.center.y = self.view.center.y * 0.6
        
        self.view.addSubview(colorgyLogo)
        
        var makeHidden = CGAffineTransformMakeScale(0, 0)
        colorgyLogo.transform = makeHidden
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.1, options: nil, animations: {
                var transformDown = CGAffineTransformMakeTranslation(0, -50)
                self.loginBackground.transform = transformDown
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.7, usingSpringWithDamping: 0.6, initialSpringVelocity: 1.0, options: nil, animations: {
                var makeAppear = CGAffineTransformMakeScale(1, 1)
                self.colorgyLogo.transform = makeAppear
            }, completion: nil)
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
