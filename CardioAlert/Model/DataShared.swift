//
//  DataShared.swift
//  CardioAlert
//
//  Created by Shakhzod Botirov on 21/09/24.
//

import SwiftUI
import PhotosUI

class DataShared: ObservableObject {
    static let shared = DataShared()
    
    @AppStorage("view") var view = "auth"
    @Published var language = "en"
    @Published var languageSheet = false
    @Published var showConnection = false
    
    @AppStorage("name") var name = ""
    @AppStorage("surname") var surname = ""
    @AppStorage("phone") var phone = ""
    @Published var birthDate = Date.now
    @Published var largeImage: Image = Image("photoEx")
    @Published var showLargeImage = false
    
    //MARK: EKG 9
    @Published var ImageItemECG9: PhotosPickerItem?
    @Published var ImagePickECG9: Image = Image("photoEx")
    @Published var confidenceECG9 = ""
    @Published var predicted_class_index = ""
    @Published var showResultPhotoPickECG9 = false
    @Published var waiting = false
    
    @Published var locationsLocal = [
        locationsData(name: "location_1", address: "address_1", phoneNumber: "+998712311639", latitude: 41.343403933250634, longitude: 69.20988743062608, distance: 0),
        locationsData(name: "location_2", address: "address_2", phoneNumber: "+998712310664", latitude: 41.27870029109558, longitude:  69.24893072062959, distance: 0),
        locationsData(name: "location_3", address: "address_3", phoneNumber: "+998712310394", latitude: 41.36554529061068, longitude: 69.33415104321215, distance: 0),
        locationsData(name: "location_4", address: "address_4", phoneNumber: "+998712311669", latitude: 41.3083855788251, longitude: 69.29876722948043, distance: 0),
        locationsData(name: "location_5", address: "address_5", phoneNumber: "+998712310674", latitude: 41.32958550623307, longitude: 69.25823961372056, distance: 0),
        
    ]
    
    func sortDataByDistance() -> [locationsData]
    {
        let unsortedArr = self.locationsLocal
        var sortedArr: [locationsData] = []
        
        let myLocation = CLLocation(latitude: (CLLocationManager().location?.coordinate.latitude)!, longitude: (CLLocationManager().location?.coordinate.longitude)!)
        
        unsortedArr.forEach { obj in
            let centrLocation = CLLocation(latitude: obj.latitude, longitude: obj.longitude)
            let distance = myLocation.distance(from: centrLocation) / 1000
            
            var tempObj = obj
            tempObj.distance = distance
            
            sortedArr.append(tempObj)
        }
                
        sortedArr.sort { obj1, obj2 in
            obj1.distance < obj2.distance
        }
        self.locationsLocal = sortedArr
        
        return sortedArr
    }
}
