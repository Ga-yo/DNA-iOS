//
//  CCommentTableViewCell.swift
//  DNA
//
//  Created by 장서영 on 2021/06/10.
//

import UIKit

class CCommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var deleteButton: UIButton!

    var commentId = Int()

    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.adjustsFontSizeToFitWidth = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
}
