//
//  LocationsModel.swift
//  CardioAlert
//
//  Created by Shakhzod Botirov on 21/09/24.
//

import Foundation

struct locationsData: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let phoneNumber: String
    let latitude: Double
    let longitude: Double
    var distance: Double
}
