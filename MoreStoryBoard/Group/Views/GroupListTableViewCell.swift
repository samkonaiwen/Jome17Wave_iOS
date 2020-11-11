//
//  GroupListTableViewCell.swift
//  Jome17Wave_iOS
//
//  Created by Karena on 2020/11/10.
//

import UIKit

class GroupListTableViewCell: UITableViewCell {
    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupLacationLabel: UILabel!
    @IBOutlet weak var groupStatusLabel: UILabel!
    @IBOutlet weak var groupDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
