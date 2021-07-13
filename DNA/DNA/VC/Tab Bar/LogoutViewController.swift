//
//  LogoutViewController.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import UIKit

final class LogoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func logoutButton(_ sender: UIButton){
        warningAlert(title: "로그아웃 하시겠습니까?", message: nil, action: {[unowned self] action in logout()}, actionTitle: "Yes", cancelActionTitle: "No")
    }
    
    private func logout() {
        Token.tokenRemove()
        let sub = UIStoryboard(name: "Auth", bundle: nil)
        let main = sub.instantiateViewController(withIdentifier: "AuthViewController") as! ViewController
        navigationController?.setViewControllers([main], animated: true)
    }
}
