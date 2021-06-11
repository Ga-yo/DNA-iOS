//
//  AViewController.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import UIKit

class AViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var MainListModel = [MainList]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //setNavigationBar()
        tableView.rowHeight = 140
        tableView.dataSource = self
        getList()
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getList()
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainListModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ACell") as! ACell
        
        let date = MainListModel[indexPath.row].timelineResponses[indexPath.row].createdAt
        
        cell.nameLabel.text = MainListModel[indexPath.row].timelineResponses[indexPath.row].name
        cell.titleLabel.text = MainListModel[indexPath.row].timelineResponses[indexPath.row].title
        cell.detailTxt.text = MainListModel[indexPath.row].timelineResponses[indexPath.row].content
        cell.yearMonthLabel.text = yearMonthFormat(date: date)
        cell.dayLabel.text = dayFormat(date: date)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let commentVC = self.storyboard?.instantiateViewController(identifier: "ACommentVC") as? ACommentViewController else {return}
        
        commentVC.id = MainListModel[indexPath.row].timelineResponses[indexPath.row].timelineId
        self.navigationController?.pushViewController(commentVC, animated: true)
    }
    
    func getList() {
        HTTPClient().get(url: ListAPI.timeLine("WORKER").path(), params: nil, header: Header.token.header()).responseJSON(completionHandler: { res in
            switch res.response?.statusCode {
            case 200:
                do {
                    print("OK")
                    let data = res.data
                    let model = try JSONDecoder().decode(MainList.self, from: data!)
//                    self.MainListModel.removeAll()
//                    self.MainListModel.append(contentsOf: model)
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
    
}
