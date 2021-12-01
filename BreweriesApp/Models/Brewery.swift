//
//  Brewerie.swift
//  BreweriesApp
//
//  Created by Raul Shafigin on 30.11.2021.
//

import Foundation

struct Brewery: Decodable {
    let name: String
    let breweryType: String?
    let street: String?
    let city: String
    let state: String?
    let country: String
    let phone: String?
    let websiteUrl: String?
    let countyProvince: String?
    
    init(breweryData: [String: Any]) {
        name = breweryData["name"] as! String
        breweryType = breweryData["brewery_type"] as? String
        street = breweryData["street"] as? String
        city = breweryData["city"] as! String
        state = breweryData["state"] as? String
        country = breweryData["country"] as! String
        phone = breweryData["phone"] as? String
        websiteUrl = breweryData["website_url"] as? String
        countyProvince = breweryData["county_province"] as? String
    }
    
    static func getBreweries(from value: Any) -> [Brewery]{
        guard let breweriesData = value as? [[String: Any]] else {return []}
        return breweriesData.compactMap { Brewery(breweryData: $0)}
    }
}
