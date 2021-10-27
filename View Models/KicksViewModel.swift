//
//  KicksViewModel.swift
//  IONO_App
//
//  Created by Alexandra Medina
//

import Foundation


class KicksViewModel {
    
    private var apiService = ApiService()
    private var kicks = [Kicks]()
    
    func fetchKicksData(completion: @escaping () -> ()) {
        
        apiService.getKickRelease { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.kicks = listOf.results
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    func numberOfRowsInSection(section: Int) -> Int {
        if kicks.count != 0 {
            return kicks.count
        }
        return 0
    }
    func cellForRowAt (indexPath: IndexPath) -> Kicks{
        return kicks[indexPath.row]
    }
}
