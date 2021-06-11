//
//  TCommentTableViewCell.swift
//  DNA
//
//  Created by 장서영 on 2021/06/10.
//

import UIKit

class TCommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak  var background: UIView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var deleteButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
