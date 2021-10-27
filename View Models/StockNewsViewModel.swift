//
//  StockNewsViewModel.swift
//  IONO_App
//
//  Created by Alexandra Medina
//

import Foundation


class StockNewsViewModel {
    
    private var apiService = ApiService()
    private var news = [StockNews]()
    
    func fetchNewsData(completion: @escaping () -> ()) {
        
        apiService.getNews { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.news = listOf.results
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    func numberOfRowsInSection(section: Int) -> Int {
        if news.count != 0 {
            return news.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> StockNews{
        return news[indexPath.row]
    }
}
