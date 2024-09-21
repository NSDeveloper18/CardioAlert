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
    
    @Published var view = "auth"
    @Published var language = "en"
    @Published var languageSheet = false
}
