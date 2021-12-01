//
//  CellView.swift
//  BreweriesApp
//
//  Created by Raul Shafigin on 30.11.2021.
//

import UIKit

class CellView: UITableViewCell {

    @IBOutlet var breverieName: UILabel!
    @IBOutlet var breverieCity: UILabel!
    @IBOutlet var breverieState: UILabel!
    
    func configure(with breverie: Brewery) {
        breverieName.text = breverie.name
        breverieCity.text = breverie.city + ","
        breverieState.text = breverie.state ?? "state"
    }

}
