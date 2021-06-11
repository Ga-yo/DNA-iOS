//
//  LoginViewController.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var pwTxt: UITextField!{
        didSet{
            pwTxt.isSecureTextEntry = true
        }
    }
    @IBOutlet weak var warningLabel : UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    let httpClient = HTTPClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNavigationBar()
    }
    
    @IBAction func signInButton(_ sender: UIButton!){
        SignIn(email: emailTxt.text!, password: pwTxt.text!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func SignIn(email: String, password: String){
        print("로그인")
        httpClient.post(url: AuthAPI.Login.path(), params: ["email":email, "password":password], header: Header.tokenIsEmpty.header()).responseJSON(completionHandler: {(response) in
            switch response.response?.statusCode {
            case 201:
                print("로그인 성공")
                guard let data = response.data else {return}
                guard let model = try? JSONDecoder().decode(SignInModel.self, from: data) else {return}
                guard let pushVC = self.storyboard?.instantiateViewController(identifier: "MenuVC") as? MenuViewController else {return}
                self.navigationController?.pushViewController(pushVC, animated: true)
            case 400:
                print("BAD REQUEST")
            case 401:
                print("UNAUTHORIZED")
            case 403:
                print("FORBIDDEN")
            case 404:
                print("NOT FOUND")
            case 409:
                print("CONFLICT")
            default :
                //self.warningLabel.isHidden = false
                print(response.response?.statusCode)
            }
        })
    }

}
