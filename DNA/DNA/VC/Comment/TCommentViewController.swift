//
//  TCommentViewController.swift
//  DNA
//
//  Created by 장서영 on 2021/06/10.
//

import UIKit

final class TCommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak private var tableView: UITableView!
    
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var yearMonthLabel: UILabel!
    @IBOutlet weak private var dayLabel: UILabel!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var detailTextView: UITextView!
    @IBOutlet weak private var deleteButton: UIButton!
    @IBOutlet weak private var commentTextField : UITextField!
    @IBOutlet weak private var background: UIView!
    
    var id = Int()
    var name = String()
    var yearMonth = String()
    var day = String()
    var Title = String()
    var content = String()
    
    var commentId = Int()
    
    private var commentList = CommentList ()
    private var commentResponse = [Comment]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList.commentResponses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellT") as! TCommentTableViewCell
        
        cell.nameLabel.text = commentList.commentResponses[indexPath.row].name
        cell.commentTextView.text = commentList.commentResponses[indexPath.row].content
        cell.commentId = commentList.commentResponses[indexPath.row].commentId
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(commentDelete(sender:)), for: .touchUpInside)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///setNavigationBar()
        tableView.delegate = self
        tableView.dataSource = self
        commentTextField.delegate = self
        getComment(id: id)
        getContent()
        tableView.rowHeight = 60
        
        nameLabel.adjustsFontSizeToFitWidth = true
        yearMonthLabel.adjustsFontSizeToFitWidth = true
        dayLabel.adjustsFontSizeToFitWidth = true
        titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    @IBAction private func deleteButton(_ sender: UIButton){
        warningAlert(title: "게시물을 삭제하시겠습니까?", message: "삭제한 게시물은 되돌릴 수 없습니다.", action: {[unowned self]action in deletePost(id: id)}, actionTitle: "예", cancelActionTitle: "아니오")
    }
    
    @IBAction private func backButton(_ sender: UIBarButtonItem){
        navigationController?.popViewController(animated: true)
    }
    
    private func getContent() {
        nameLabel.text = name
        yearMonthLabel.text = yearMonth
        dayLabel.text = day
        titleLabel.text = Title
        detailTextView.text = content
    }
    
    private func deletePost(id: Int){
        HTTPClient().delete(url: ListAPI.deleteTimeLine(id).path(), params: nil, header: Header.token.header())
            .responseJSON(completionHandler: {[unowned self]res in
                switch res.response?.statusCode {
                case 200:
                    navigationController?.popViewController(animated: true)
                case 400:
                    print("400 - BAD REQUEST")
                    errorAlert()
                case 401:
                    print("401 - UNAUTHORIZED")
                    errorAlert()
                case 403:
                    print("403 - FORBIDDEN")
                    showAlert(title: "권한이 없습니다.", message: "게시물을 삭제할 수 없습니다.", action: nil, actionTitle: "확인")
                case 404:
                    print("404 - NOT FOUND - comment")
                    errorAlert()
                case 409:
                    print("409 - CONFLICT")
                    errorAlert()
                default:
                    print(res.response?.statusCode)
                    errorAlert()
                }
            })
    }
    
    private func getComment(id : Int) {
        HTTPClient().get(url: CommentListAPI.commentList(id).path(), params: nil, header: Header.token.header()).responseJSON(completionHandler: {[unowned self]res in
            switch res.response?.statusCode {
            case 200:
                let model = try? JSONDecoder().decode(CommentList.self, from: res.data!)
                commentList.commentResponses.removeAll()
                commentList.commentResponses.append(contentsOf: model!.commentResponses)
                tableView.reloadData()
            case 400:
                print("400 - BAD REQUEST")
                errorAlert()
            case 401:
                print("401 - UNAUTHORIZED")
                errorAlert()
            case 403:
                print("403 - FORBIDDEN")
                errorAlert()
            case 404:
                print("404 - NOT FOUND - getcomment")
                errorAlert()
            case 409:
                print("409 - CONFLICT")
                errorAlert()
            default:
                print(res.response?.statusCode)
                errorAlert()
            }
        })
    }
    
    private func createComment(id: Int, content: String){
        HTTPClient().post(url: CommentListAPI.commentWr.path(), params: ["timelineId" : id, "content": content], header: Header.token.header())
            .responseJSON(completionHandler: {[unowned self]res in
                switch res.response?.statusCode {
                case 201:
                    getComment(id: id)
                    tableView.reloadData()
                    commentTextField.text = nil
                case 400:
                    print("400 - BAD REQUEST")
                    errorAlert()
                case 401:
                    print("401 - UNAUTHORIZED")
                    errorAlert()
                case 403:
                    print("403 - FORBIDDEN")
                    errorAlert()
                case 404:
                    print("404 - NOT FOUND - comment")
                    errorAlert()
                case 409:
                    print("409 - CONFLICT")
                    errorAlert()
                default:
                    print(res.response?.statusCode)
                    errorAlert()
                    
                }
            })
    }
    
    private func deleteComment(commentId: Int) {
        HTTPClient().delete(url: CommentListAPI.deleteComment(commentId).path(), params: nil, header: Header.token.header())
            .responseJSON(completionHandler: {[unowned self]res in
                switch res.response?.statusCode {
                case 200:
                    print("success")
                    getComment(id: id)
                    tableView.reloadData()
                    showAlert(title: "댓글이 삭제되었습니다.",
                              message: nil,
                              action: nil,
                              actionTitle: "확인")
                case 400:
                    print("400 - BAD REQUEST")
                    errorAlert()
                case 401:
                    print("401 - UNAUTHORIZED")
                    errorAlert()
                case 403:
                    print("403 - FORBIDDEN")
                    showAlert(title: "권한이 없습니다.", message: "댓글을 삭제할 수 없습니다.", action: nil, actionTitle: "확인")
                case 404:
                    print("404 - NOT FOUND - comment")
                    errorAlert()
                case 409:
                    print("409 - CONFLICT")
                    errorAlert()
                default:
                    print(res.response?.statusCode)
                    errorAlert()
                }
            })
    }
    
    @objc private func commentDelete(sender: UIButton){
        warningAlert(title: "댓글을 삭제하시겠습니까?", message: "삭제한 댓글은 되돌릴 수 없습니다.", action: {[unowned self] action in
            deleteComment(commentId: commentList.commentResponses[sender.tag].commentId)
        }, actionTitle: "삭제", cancelActionTitle: "취소")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.commentTextField {
            createComment(id: id, content: commentTextField.text!)
        }
        return true
    }
    
}
