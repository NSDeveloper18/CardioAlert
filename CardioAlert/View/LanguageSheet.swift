//
//  LanguageSheet.swift
//  CardioAlert
//
//  Created by Shakhzod Botirov on 21/09/24.
//

import SwiftUI

struct LanguageSheet: View {
    @ObservedObject var datas: DataShared = .shared
    private var language = LocalizationService.shared.language
    var body: some View {
        VStack(spacing: 0.0) {
            HStack {
                Spacer()
                Rectangle()
                    .foregroundColor(Color(.systemGray5))
                    .frame(width: 41, height: 4)
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                Spacer()
            }
            .padding(.top, 5)
            
            HStack {
                Spacer()
                Text("editLanguage".localized(language))
                    .font(.system(size: 22).weight(.bold))
                    .foregroundColor(Color(hex: "#8B0001").opacity(0.7))
                    .frame(height: 28)
                Spacer()
            }
            .padding(.vertical, 24)
            
            Button {
                LocalizationService.shared.language = .english_us
                datas.language = "en"
                datas.languageSheet = false
            } label: {
                HStack(spacing: 8.0) {
                    Image("engFlag")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .cornerRadius(50)
                    
                    Text("English")
                        .font(.system(size: 17))
                        .foregroundColor(Color(.black))
                    
                    Spacer()
                    
                    Image(LocalizationService.shared.language == .english_us ? "CircleCheckMark" : "Circle")
                        .frame(width: 24, height: 22)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .frame(height: 50)
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .opacity(LocalizationService.shared.language == .english_us ? 1.0 : 0.9)
                .padding(.bottom, 8)
            }
            
            Button {
                LocalizationService.shared.language = .uzbek
                datas.language = "uz"
                datas.languageSheet = false
            } label: {
                HStack(spacing: 8.0) {
                    Image("uzFlag")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .cornerRadius(50)
                    
                    Text("O’zbekcha")
                        .font(.system(size: 17))
                        .foregroundColor(Color(.black))
                    
                    Spacer()
                    
                    Image(LocalizationService.shared.language == .uzbek ? "CircleCheckMark" : "Circle")
                        .frame(width: 24, height: 22)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .frame(height: 50)
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .opacity(LocalizationService.shared.language == .uzbek ? 1.0 : 0.9)
                .padding(.bottom, 8)
            }
            
            Button {
                LocalizationService.shared.language = .russian
                datas.language = "ru"
                datas.languageSheet = false
            } label: {
                HStack(spacing: 8.0) {
                    Image("ruFlag")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .cornerRadius(50)
                    
                    Text("Русский")
                        .font(.system(size: 17))
                        .foregroundColor(Color(.black))
                    
                    Spacer()
                    
                    Image(LocalizationService.shared.language == .russian ? "CircleCheckMark" : "Circle")
                        .frame(width: 24, height: 22)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .frame(height: 50)
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .opacity(LocalizationService.shared.language == .russian ? 1.0 : 0.9)
                .padding(.bottom, 48)
            }
        }
        .padding(.horizontal, 24)
        .background(AngularGradient(
            gradient: Gradient(colors: [Color(hex: "#FE0944"), Color(hex: "#FEAE96")]),
            center: .bottomTrailing,
            startAngle: .degrees(90),
            endAngle: .degrees(300))
            .blur(radius: 70, opaque: true).ignoresSafeArea())
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        .padding(.bottom, -34)
    }
}

#Preview {
    LanguageSheet()
}
