//
//  ViewControllerExtension.swift
//  DNA
//
//  Created by 장서영 on 2021/05/06.
//

import UIKit



extension UIViewController {
    
    func setNavigationBar(){
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }
    
    func shadow(_ button: UIButton){
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowRadius = 9
    }
    
    
    
}
