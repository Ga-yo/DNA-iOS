//
//  WritingViewController.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import UIKit
import Alamofire
import DropDown

final class WritingViewController: UIViewController {
    
    @IBOutlet weak private var backgroundView: UIView!
    @IBOutlet weak private var SetCategoryButton: UIButton!
    @IBOutlet weak private var titleTxt: UITextField!
    @IBOutlet weak private var detailTxt: UITextView!
    @IBOutlet weak private var registButton: UIButton!
    @IBOutlet weak private var backregist: UIView!
    
    private var selectedItem = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction private func setCategoryButton(_ sender: UIButton){
        showDropDown(sender)
    }
    
    @IBAction private func createButton(_ sender: UIButton){
        createPost(title: titleTxt.text!, content: detailTxt.text!, type: setSelectedItem(selectedItem: selectedItem))
    }
    
    private func showDropDown(_ sender: UIButton){
        let dropDown = DropDown()
        dropDown.dataSource = ["T - 대리구매자 구하기", "G - 잠수탄 친구 찾기", "C - 일반 대화 하기", "A - 노동자 구하기"]
        dropDown.anchorView = sender
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        dropDown.cellHeight = 28
        dropDown.textFont = UIFont.systemFont(ofSize: 14)
        dropDown.show()
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            SetCategoryButton.setTitle("\(item)", for: .normal)
            selectedItem = item
        }
    }
    
    private func setSelectedItem(selectedItem: String)-> String {
        if selectedItem == "A - 노동자 구하기"{
            return "WORKER"
        }
        
        if selectedItem == "T - 대리구매자 구하기" {
            return "BUYER"
        }
        if selectedItem == "G - 잠수탄 친구 찾기"{
            return "DIVER"
        }
        
        if selectedItem == "C - 일반 대화 하기" {
            return "COMMON"
        }
        return "ERROR"
    }
    
    private func createPost(title: String, content: String, type: String) {
        HTTPClient().post(url: ListAPI.timeLineWr.path(), params: ["title" : title, "content": content, "type" : type], header: Header.token.header()).responseJSON{[unowned self](response) in
            switch response.response?.statusCode {
            case 201 : print("CREATED")
                titleTxt.text = ""
                detailTxt.text = ""
                SetCategoryButton.setTitle("카테고리를 설정해 주세요", for: .normal)
                showAlert(title: "게시물 작성을 성공적으로 완료하였습니다.", message: nil, action: nil, actionTitle: "확인")
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
        }
    }
}
