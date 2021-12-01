//
//  DetailedInfoViewController.swift
//  BreweriesApp
//
//  Created by Raul Shafigin on 30.11.2021.
//

import UIKit

class DetailedInfoViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var streetLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var websiteLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    
    var brewery: Brewery!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Brewery name: \(brewery.name)"
        typeLabel.text = "Brewery type: \(brewery.breweryType ?? "micro")"
        streetLabel.text = "Address \(brewery.street ?? ""), \(brewery.city), \(brewery.state ?? brewery.countyProvince ?? "")"
        countryLabel.text = brewery.country
        websiteLabel.text = "Website: \(brewery.websiteUrl ?? "-")"
        phoneLabel.text = "Phone: \(brewery.phone ?? "-")"
    }
}
