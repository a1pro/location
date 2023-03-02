//
//  CustomTableViewCell.swift
//  Location
//
//  Created by Rakesh on 28/02/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var lblPcs: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        colorView.layer.cornerRadius = colorView.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
}
