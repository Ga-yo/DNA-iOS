//
//  ViewControllerExtension.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
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
    
    func yearMonthFormat(date : String) -> String{
        let componentDate = date.components(separatedBy: [":", "-", ".", "T"])
        
        let formatDate = componentDate[0] + "년" + componentDate[1] + "월"
        
        return formatDate
    }
    
    func dayFormat(date : String) -> String{
        let componentDate = date.components(separatedBy: [":", "-", ".", "T"])
        
        let formatDate = componentDate[3] 
        
        return formatDate
    }
}
