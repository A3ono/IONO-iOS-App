//
//  KicksViewController.swift
//  IONO_App
//
//  Created by Alexandra Medina on 10/25/21.
//

import UIKit

class KicksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var kicksTable: UITableView!
    private var viewModel = KicksViewModel()
    

    @IBAction func toNewsBtn(_ sender: Any) {
    performSegue(withIdentifier: "segue4", sender: self)
    }
    
    // MARK:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadKicks()
    }
    
    // MARK:
    
    private func loadKicks() {
        
        
        viewModel.fetchKicksData { [weak self] in
            self?.kicksTable.dataSource = self
            self?.kicksTable.reloadData()
        }
    }

    // MARK:


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }

    // MARK:
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! KicksTableViewCell
       
        
        let detail = viewModel.cellForRowAt(indexPath: indexPath)
        cell2.setCellWithValuesOf(detail)
        
        return cell2
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    // MARK:
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
