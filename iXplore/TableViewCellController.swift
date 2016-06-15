//
//  TableViewCellController.swift
//  iXplore
//
//  Created by Chris Motz on 6/8/16.
//  Copyright © 2016 iXperience. All rights reserved.
//

import UIKit

class TableViewCellController: UITableViewCell {


    var cellImage = UIImageView()
    var cellLabel = UILabel()
    var dateLabel = UILabel()
    


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellImage = UIImageView(frame: CGRectMake(8, 8, 88, 88))
        cellLabel = UILabel(frame: CGRectMake(104, 8, 235, 44))
        dateLabel = UILabel(frame: CGRectMake(194, 52, 235, 44))

        self.addSubview(cellImage)
        self.addSubview(cellLabel)
        self.addSubview(dateLabel)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
