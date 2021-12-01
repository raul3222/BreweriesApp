//
//  MainViewController.swift
//  BreweriesApp
//
//  Created by Raul Shafigin on 30.11.2021.
//

import Alamofire

class MainViewController: UITableViewController {
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    let link = "https://api.openbrewerydb.org/breweries"
    var breweries: [Brewery] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
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
            let brewery = breweries[indexPath.row]
            detailedVC.brewery = brewery
    }

    func alamofireGetData() {
        NetworkManager.shared.fetchData(from: link, completion: { result in
            switch result {
            case .success(let breweries):
                self.breweries = breweries
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        })
    }
}
