//
//  GCommentViewController.swift
//  DNA
//
//  Created by 장서영 on 2021/06/10.
//

import UIKit

class GCommentViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearMonthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var background: UIView!
    
    private var commentList : [CommentList] = [CommentList]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GCommentTableViewCell
        
        cell.nameLabel.text = commentList[indexPath.row].commentResponses[indexPath.row].name
        cell.commentTextView.text = commentList[indexPath.row].commentResponses[indexPath.row].content
        return cell
    }
    
    func getComment(id : Int) {
        HTTPClient().get(url: CommentListAPI.commentList(id).path(), params: nil, header: Header.token.header()).responseJSON(completionHandler: {(res) in
            switch res.response?.statusCode {
            case 200:
                do {
                    print("OK")
                    let data = res.data
                    let model = try JSONDecoder().decode(CommentList.self, from: data!)
                    
                    self.commentList.removeAll()
                    self.commentList.append(model)
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
            case 400:
                print("400 - BAD REQUEST")
            case 401:
                print("401 - UNAUTHORIZED")
            case 403:
                print("403 - FORBIDDEN")
            case 404:
                print("404 - NOT FOUND")
            case 409:
                print("409 - CONFLICT")
            default:
                print(res.response?.statusCode)
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
