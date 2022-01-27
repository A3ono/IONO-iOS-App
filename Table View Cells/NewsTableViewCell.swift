//
//  NewsTableViewCell.swift
//  IONO_App
//
//  Created by Alexandra Medina on 10/23/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!


      
    // MARK: 
    private var urlString: String = ""
    
    // MARK: Setup Category Values
        func setCellWithValuesOf(_ results:StockNews){
            updateUI(newsAuthor: results.author,
                     newsTitle: results.title,
                     newsDate: results.published_utc,
                     newsIMG: results.image_url)
        
        }

    // MARK: Update the UI Views
    private func updateUI(newsAuthor: String?, newsTitle: String?, newsDate: String?, newsIMG: String?){
        
        self.newsTitleLabel.text = newsAuthor
        self.newsAuthorLabel.text = newsTitle
        self.newsDateLabel.text = newsDate
        
        guard let imageString = newsIMG else {return}
        urlString = imageString
        
        guard let newsImageURL = URL(string: urlString) else {
            self.newsImageView.image = UIImage(named: "noImageAvailable")
            return
        }
        
        self.newsImageView.image = nil
        
        getImageDataFrom(url: newsImageURL)
        
        newsImageView.layer.masksToBounds = true
        newsImageView.layer.cornerRadius = 5
        //newsImageView.bounds.width / 2
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
                    self.newsImageView.image = image
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
