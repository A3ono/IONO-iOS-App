//
//  StockTableViewCell.swift
//  IONO
//
//  Created by Alexandra Medina
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var labelClose: UILabel!
    @IBOutlet weak var labelLow: UILabel!
    @IBOutlet weak var labelHigh: UILabel!
    @IBOutlet weak var labelVolume: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
