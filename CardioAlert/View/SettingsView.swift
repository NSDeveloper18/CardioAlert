//
//  SettingsView.swift
//  CardioAlert
//
//  Created by Shakhzod Botirov on 21/09/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        datas.view = "auth"
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color(.white))
                        .font(.system(size: 20))
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("")
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
        }
    }
}

#Preview {
    SettingsView()
}
