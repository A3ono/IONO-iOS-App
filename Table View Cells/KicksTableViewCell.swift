//
//  KicksTableViewCell.swift
//  IONO_App
//
//  Created by Alexandra Medina on 10/26/21.
//

import UIKit

class KicksTableViewCell: UITableViewCell {
    
    @IBOutlet weak var kickNameLabel: UILabel!
    //@IBOutlet weak var kickURLLabel: UILabel!
    @IBOutlet weak var kickDateLabel: UILabel!
    @IBOutlet weak var kickPriceLabel: UILabel!
    @IBOutlet weak var kicksImageView: UIImageView!

    // MARK:
    private var urlString: String = ""
    
    // MARK: Setup Category Values
        func setCellWithValuesOf(_ results:Kicks){
            updateUI(kickName: results.shoes_name,
                     //kickURL: results.shoes_url,
                     kickDate: results.shoes_date,
                     kickPrice: results.shoes_price,
                     kickIMG: results.shoes_image
                     //kickUrlIMG: results.shoes_image_url
            )
        
        }

    // MARK: Update the UI Views
    private func updateUI(
        kickName: String?,
        //kickURL: String?,
        kickDate: String?,
        kickPrice: String?,
        kickIMG: String?
        //kickUrlIMG: String?
    ){
        
        self.kickNameLabel.text = kickName
        //self.kickURLLabel.text = kickURL
        self.kickDateLabel.text = kickDate
        self.kickPriceLabel.text = kickPrice
        //self.kicksImageView.text = kickIMG
        //self.kickUrlIMGLabel.text = kickUrlIMG
        
       guard let imageString = kickIMG else {return}
        urlString = imageString
        
        guard let kickImageURL = URL(string: urlString) else {
            self.kicksImageView.image = UIImage(named: "noImageAvailable")
            return
        }
        
        self.kicksImageView.image = nil
        
        getImageDataFrom(url: kickImageURL)
       
        }
    
    // MARK:
  private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.kicksImageView.image = image
                }
            }
        }.resume()
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
