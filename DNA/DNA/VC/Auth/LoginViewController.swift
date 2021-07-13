//
//  LoginViewController.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import UIKit
import Alamofire

final class LoginViewController: UIViewController {
    
    @IBOutlet weak private var circle: UIView!
    @IBOutlet weak private var emailTxt: UITextField!
    @IBOutlet weak private var pwTxt: UITextField!{
        didSet{
            pwTxt.isSecureTextEntry = true
        }
    }
    @IBOutlet weak private var warningLabel : UILabel!
    @IBOutlet weak private var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        emailTxt.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        pwTxt.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
    }
    
    @IBAction private func signInButton(_ sender: UIButton!){
        SignIn(email: emailTxt.text!, password: pwTxt.text!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func SignIn(email: String, password: String){
        print("로그인")
        HTTPClient().post(url: AuthAPI.Login.path(), params: ["email":email, "password":password], header: Header.tokenIsEmpty.header()).responseJSON(completionHandler: {[unowned self] response in
            switch response.response?.statusCode {
            case 201:
                let model = try? JSONDecoder().decode(SignInModel.self, from: response.data!)
                Token.token = model!.access_token
                
                let sub = UIStoryboard(name: "Main", bundle: nil)
                let main = sub.instantiateViewController(withIdentifier: "MainTabBarViewController") as! MainTabBarViewController
                navigationController?.setViewControllers([main], animated: false)
            case 400:
                print("BAD REQUEST")
                errorAlert()
            case 401:
                print("UNAUTHORIZED")
                errorAlert()
            case 403:
                print("FORBIDDEN")
                errorAlert()
            case 404:
                print("NOT FOUND")
                errorAlert()
            case 409:
                print("CONFLICT")
                errorAlert()
            default :
                print(response.response?.statusCode)
                errorAlert()
            }
        })
    }
    
}
