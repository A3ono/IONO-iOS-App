//
//  WatchlistTableViewCell.swift
//  IONO_App
//
//  Created by Alexandra Medina on 1/11/22.
//

import UIKit

class WatchlistTableViewCell: UITableViewCell {


    @IBOutlet weak var cLabel: UILabel!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var hLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!

    // MARK:
    private var urlString: String = ""
    
    // MARK: Setup Category Values
        func setCellWithValuesOf(_ results:Quote){
            updateUI(current: results.c,
                     change: results.d,
                     //percChange: results.dp,
                     high1: results.h,
                     low: results.l
                     //open: results.o,
                     //previous: results.p
                     
            )
        
        }

    // MARK: Update the UI Views
    private func updateUI(
        current: Any?,
        change: Any?,
        //percChange: Any?,
        high1: Any?,
        low: Any?
        //open: Any?
        //previous: Any?
    ){
        
        self.cLabel.text = (current as! String)
        self.dLabel.text = (change as! String)
        self.lLabel.text = (low as! String)
        self.hLabel.text = (high1 as! String)
        
        }

        
    // MARK:
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

    // MARK:
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
 
 
}
