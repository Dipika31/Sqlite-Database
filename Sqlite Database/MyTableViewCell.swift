//
//  MyTableViewCell.swift
//  Sqlite Database
//
//  Created by Choudhary Dipika on 03/04/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}
