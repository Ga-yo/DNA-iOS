//
//  TCell.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import UIKit

class TCell: UITableViewCell {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearMonthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailTxt: UITextView!
    @IBOutlet weak var deleteBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//  이렇게 해줄 수 있음
//    func configCell(_ data: TimeLine) {
//        nameLabel.text = data.name
//        titleLabel.text = data.title
//        detailTxt.text = data.content
//        yearMonthLabel.text = yearMonthFormat(date: date)
//        dayLabel.text = dayFormat(date: date)
//    }
}
