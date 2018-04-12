//
//  ListTableViewCell.swift
//  tango oni
//
//  Created by 原 あゆみ on 2018/04/11.
//  Copyright © 2018年 原あゆみ. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var englishLabel : UILabel!
    @IBOutlet var japaneseLabel : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
