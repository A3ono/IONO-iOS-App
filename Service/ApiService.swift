//
//  ApiService.swift
//  IONO_App
//
//  Created by Alexandra Medina on 10/23/21.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    // MARK: 
    
    func getNews(completion: @escaping (Result<StockNewsModel, Error>) ->
                       Void) {
        
        let newsURL = "https://api.polygon.io/v2/reference/news?limit=25&sort=published_utc&apiKey=GAZtLFf0QIQCun740JNWpSOBQxDxIpp7"
        
        guard let url = URL(string:newsURL) else {return}
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
     // MARK: Handle Error
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
            //Handle Empty Response
            print("Empty Response")
            return
            }
        
        print("Response status code: \(response.statusCode)")
        
        guard let data = data else{
            //Handle Empty data
            print("Empty Data")
            return
        }
        
        do {
            
        // MARK: Parse Data
            
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(StockNewsModel.self, from: data)
            
            DispatchQueue.main.async {
                completion(.success(jsonData))
            }
        } catch let error{
            completion(.failure(error))
        }
        
}
    dataTask?.resume()

    }
    
    // MARK:
    
    func getKickRelease(completion: @escaping (Result<KicksModel, Error>) ->
                       Void) {
        
        let kicksURL = "http://localhost:80/MyWebService/api/getKicks.php"
        
        guard let url = URL(string:kicksURL) else {return}
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
     // MARK: Handle Error
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
            //Handle Empty Response
            print("Empty Response")
            return
            }
        
        print("Response status code: \(response.statusCode)")
        
        guard let data = data else{
            //Handle Empty data
            print("Empty Data")
            return
        }
        
        do {
            
        // MARK: Parse Data
            
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(KicksModel.self, from: data)
            
            DispatchQueue.main.async {
                completion(.success(jsonData))
            }
        } catch let error{
            completion(.failure(error))
        }
        
}
    dataTask?.resume()

    }
  /*
    // MARK:
    
    func getWatchlist(completion: @escaping (Result<watchlistModel2, Error>) ->
                       Void) {
        
        let listURL = "https://finnhub.io/api/v1/quote?symbol=AAPL&token=c7esdlqad3ib5ruedf8g"
        
        guard let url = URL(string:listURL) else {return}
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
     // MARK: Handle Error
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
            //Handle Empty Response
            print("Empty Response")
            return
            }
        
        print("Response status code: \(response.statusCode)")
        
        guard let data = data else{
            //Handle Empty data
            print("Empty Data")
            return
        }
        
        do {
            
        // MARK: Parse Data
            
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(watchlistModel2.self, from: data)
            
            DispatchQueue.main.async {
                completion(.success(jsonData))
            }
        } catch let error{
            completion(.failure(error))
        }
        
}
    dataTask?.resume()

    }
   */
    // MARK:
    
    func getQuote(completion: @escaping (Result<watchlistModel, Error>) ->
                       Void) {
        
        let quoteURL = "http://localhost:80/MyWebService/api/getQuote.php"
        
        guard let url = URL(string:quoteURL) else {return}
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
     // MARK: Handle Error
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
            //Handle Empty Response
            print("Empty Response")
            return
            }
        
        print("Response status code: \(response.statusCode)")
        
        guard let data = data else{
            //Handle Empty data
            print("Empty Data")
            return
        }
        
        do {
            
        // MARK: Parse Data
            
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(watchlistModel.self, from: data)
            
            DispatchQueue.main.async {
                completion(.success(jsonData))
            }
        } catch let error{
            completion(.failure(error))
        }
        
}
    dataTask?.resume()

    }
  

}
