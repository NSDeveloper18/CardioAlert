//
//  ViewController.swift
//  CardioAlert
//
//  Created by Shakhzod Botirov on 21/09/24.
//

import SwiftUI

struct ViewController: View {
    @ObservedObject var datas: DataShared = .shared
    var body: some View {
        VStack {
            switch datas.view {
            case "auth": AuthView()
            case "home": HomeView()
            case "settings": SettingsView()
            case "ecg": HomeECGView()
            case "checkEcg": SelfCheckECGView()
                
            default: AuthView()
            }
        }
        .preferredColorScheme(.light)
        .sheet(isPresented: $datas.languageSheet) {
            if #available(iOS 16.4, *) {
                LanguageSheet()
                    .modifier(BottomViewModifier())
                    .presentationBackground(.clear)
            } else {
                LanguageSheet()
                    .modifier(BottomViewModifier())
            }
        }
    }
}

#Preview {
    ViewController()
}

