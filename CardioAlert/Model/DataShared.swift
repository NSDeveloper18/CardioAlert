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
}
