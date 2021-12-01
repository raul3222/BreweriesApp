//
//  MainViewController.swift
//  BreweriesApp
//
//  Created by Raul Shafigin on 30.11.2021.
//

import UIKit
import Alamofire

class MainViewController: UITableViewController {
    let link = "https://api.openbrewerydb.org/breweries"
    var breweries: [Brewery] = []
    override func viewDidLoad() {
        super.viewDidLoad()
//        NetworkManager.shared.fetchData(dataType: [Brewery].self, from: link) { result in
//            switch result {
//            case .success(let data):
//                self.breweries = data
//                self.tableView.reloadData()
//            case .failure(let error):
//                print(error.localizedDescription)
//                print(NetworkError.noData)
//            }
//        }
        alamofireGetData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breweries.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellView
        
        cell.configure(with: breweries[indexPath.row])
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let detailedVC = segue.destination as? DetailedInfoViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let brewerie = breweries[indexPath.row]
            detailedVC.brewery = brewerie
    }

    func alamofireGetData() {
        AF.request(link)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    self.breweries = Brewery.getBreweries(from: value)
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
   
}
