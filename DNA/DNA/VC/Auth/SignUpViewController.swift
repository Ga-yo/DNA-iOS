//
//  SignUpViewController.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import UIKit
import Alamofire

final class SignUpViewController: UIViewController {

    @IBOutlet weak private var circle: UIView!
    @IBOutlet weak private var nameTxt: UITextField!
    @IBOutlet weak private var emailTxt: UITextField!
    @IBOutlet weak private var confirmEmailButton: UIButton!
    @IBOutlet weak private var warningLabel: UILabel!
    @IBOutlet weak private var pwTxt: UITextField!{
        didSet {
            pwTxt.isSecureTextEntry = true
        }
    }
    @IBOutlet weak private var confirmPwTxt: UITextField!{
        didSet {
            confirmPwTxt.isSecureTextEntry = true
        }
    }
    @IBOutlet weak private var signUpButton: UIButton!
    
    private let id = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        emailTxt.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        nameTxt.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        confirmPwTxt.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        pwTxt.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction private func confirmEmailButton(_ sender: UIButton){
        HTTPClient().get(url: AuthAPI.email(id).path(), params: nil, header: Header.tokenIsEmpty.header()).responseJSON(completionHandler: {
            [unowned self] response in
            switch response.response?.statusCode {
            case 200 :
                print("SUCCESS")
                confirmEmailButton.setTitle("확인완료", for: .normal)
            case 400: print("BAD REQUEST")
                confirmEmailButton.setTitle("확인불가", for: .normal)
            default : print(response.error ?? 0)
                errorAlert()
            }
        })
    }
    
    @IBAction private func signUpButton(_ sender: UIButton){
        guard let Name = nameTxt.text else {return}
        guard let Email = emailTxt.text else {return}
        guard let Password = pwTxt.text else {return}
        signUp(name: Name, email: Email, password: Password)
    }
    
    private func signUp(name: String, email: String, password: String){
        HTTPClient().post(url: AuthAPI.signUp.path(), params: ["name":name, "email":email, "password":password], header: Header.tokenIsEmpty.header()).responseJSON(completionHandler: {
            [unowned self] response in
            switch response.response?.statusCode {
            case 201:
                print("SUCCESS")
                navigationController?.popViewController(animated: true)
            case 400:
                warningLabel.isHidden = false
                print("BAD REQUEST")
                errorAlert()
            case 401:
                warningLabel.isHidden = false
                print("UNAUTHORIZED")
                errorAlert()
            case 403:
                warningLabel.isHidden = false
                print("FORBIDDEN")
                errorAlert()
            case 404:
                warningLabel.isHidden = false
                print("NOT FOUND")
                errorAlert()
            case 409:
                warningLabel.isHidden = false
                print("CONFLICT")
                errorAlert()
            default :
                warningLabel.isHidden = false
                print(response.response?.statusCode ?? 0)
                errorAlert()
            }
        })
    }
}
