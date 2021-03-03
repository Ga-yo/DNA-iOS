//
//  SignUpVC.swift
//  DNA
//
//  Created by 장서영 on 2021/02/11.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var confirmEmailButton: UIButton!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var pwTxt: UITextField!{
        didSet {
            pwTxt.isSecureTextEntry = true
        }
    }
    @IBOutlet weak var confirmPwTxt: UITextField!{
        didSet {
            confirmPwTxt.isSecureTextEntry = true
        }
    }
    @IBOutlet weak var signUpButton: UIButton!
    
    
    let httpclient = HTTPClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        circle.layer.cornerRadius = 0.5 * circle.bounds.size.width
        nameTxt.layer.cornerRadius = 22
        emailTxt.layer.cornerRadius = 22
        confirmEmailButton.layer.cornerRadius = 12
        pwTxt.layer.cornerRadius = 22
        confirmPwTxt.layer.cornerRadius = 22
        signUpButton.layer.cornerRadius = 22
        warningLabel.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func confirmEmailButton(_ sender: UIButton){
        
    }
    
    @IBAction func signUpButton(_ sender: UIButton){
        SignUp(name: nameTxt.text!, email: emailTxt.text!, password: pwTxt.text!)
    }
    
    func email(isCorrect: Bool){
        
    }
    
    func SignUp(name: String, email: String, password: String){
        httpclient.post(.SignUp(name, email, password)).responseJSON(completionHandler: {
            response in
            switch response.response?.statusCode {
            case 201: print("success")
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
                self.warningLabel.isHidden = false
                print(response.response?.statusCode)
            }
        })
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
