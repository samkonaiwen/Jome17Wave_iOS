//
//  MapTableViewCell.swift
//  Jome17Wave_iOS
//
//  Created by SAM on 2020/11/3.
//

import UIKit

class MapTableViewCell: UITableViewCell {
    @IBOutlet weak var ivMap: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbSide: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
