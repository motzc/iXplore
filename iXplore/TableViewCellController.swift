//
//  TableViewCellController.swift
//  iXplore
//
//  Created by Chris Motz on 6/8/16.
//  Copyright © 2016 iXperience. All rights reserved.
//

import UIKit

class TableViewCellController: UITableViewCell {


    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
