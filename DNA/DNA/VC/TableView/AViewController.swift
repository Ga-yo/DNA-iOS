//
//  AViewController.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import UIKit

//A, G, T, C 이게 다 의미가 있는건가??
final class AViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var MainListModel = MainList()
    private var timeLine : [TimeLine] = [TimeLine]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
        getList()
        tableView.reloadData()
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getList()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainListModel.timelineResponses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ACell") as! ACell
        
        let date = MainListModel.timelineResponses[indexPath.row].createdAt
        
        cell.nameLabel.text = MainListModel.timelineResponses[indexPath.row].name
        cell.titleLabel.text = MainListModel.timelineResponses[indexPath.row].title
        cell.detailTxt.text = MainListModel.timelineResponses[indexPath.row].content
        cell.yearMonthLabel.text = yearMonthFormat(date: date)
        cell.dayLabel.text = dayFormat(date: date)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let commentVC = storyboard?.instantiateViewController(withIdentifier: "ACommentVC") as? ACommentViewController else {return}
        
        let date = MainListModel.timelineResponses[indexPath.row].createdAt
        
        commentVC.id = MainListModel.timelineResponses[indexPath.row].timelineId
        commentVC.Title = MainListModel.timelineResponses[indexPath.row].title
        commentVC.content = MainListModel.timelineResponses[indexPath.row].content
        commentVC.name = MainListModel.timelineResponses[indexPath.row].name
        commentVC.yearMonth = yearMonthFormat(date: date)
        commentVC.day = dayFormat(date: date)
        print(commentVC.id)
        navigationController?.pushViewController(commentVC, animated: true)
    }
    
    @IBAction private func backButton(_ sender: UIBarButtonItem){
        navigationController?.popViewController(animated: true)
    }
    
    private func getList() {
        HTTPClient().get(url: ListAPI.timeLine("WORKER").path(), params: nil, header: Header.token.header()).responseJSON(completionHandler: {[unowned self] res in
            switch res.response?.statusCode {
            case 200:
                let model = try? JSONDecoder().decode(MainList.self, from: res.data!)
                MainListModel.timelineResponses.removeAll()
                MainListModel.timelineResponses.append(contentsOf: model!.timelineResponses)
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
                print("404 - NOT FOUND")
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
    
}
