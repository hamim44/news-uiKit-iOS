//
//  CustomCell.swift
//  news
//
//  Created by Abrar Hamim on 27/7/24.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var newsID: UILabel!
    @IBOutlet weak var newstitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
