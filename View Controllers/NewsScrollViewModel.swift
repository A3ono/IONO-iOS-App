//
//  NewsScrollViewModel.swift
//  IONO_App
//
//  Created by Alexandra Medina on 1/23/22.
//

import Foundation

class NewsScrollViewModel {
    
    private var apiService = ApiService()
    private var quotes = [Quote]()
    
    func fetchTickerData(completion: @escaping () -> ()) {
        
        apiService.getQuote { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.quotes = listOf.quotes
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    func numberOfRowsInSection(section: Int) -> Int {
        if quotes.count != 0 {
            return quotes.count
        }
        return 0
    }
    func cellForRowAt (indexPath: IndexPath) -> Quote{
        return quotes[indexPath.row]
    }
}
