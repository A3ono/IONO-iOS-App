//
//  WatchlistViewController.swift
//  IONO_App
//
//  Created by Alexandra Medina on 1/11/22.
//

import UIKit

class WatchlistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var watchlistTable: UITableView!
    private var viewModel = WatchlistViewModel()
    

    // MARK:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTickerData()
    }
    
    // MARK:
    
    private func loadTickerData() {
        
        
        viewModel.fetchTickerData { [weak self] in
            self?.watchlistTable.dataSource = self
            self?.watchlistTable.reloadData()
        }
    }

    // MARK:


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }

    // MARK:
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! WatchlistTableViewCell
       
        
        let detail = viewModel.cellForRowAt(indexPath: indexPath)
        cell3.setCellWithValuesOf(detail)
        
        return cell3
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    // MARK:
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}


