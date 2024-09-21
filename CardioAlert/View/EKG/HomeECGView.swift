//
//  HomeECGView.swift
//  CardioAlert
//
//  Created by Shakhzod Botirov on 21/09/24.
//

import SwiftUI

struct HomeECGView: View {
    @ObservedObject var datas: DataShared = .shared
    var language = LocalizationService.shared.language
    var body: some View {
        VStack {
            
            HStack {
                Button {
                    withAnimation {
                        datas.view = "home"
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
            
            HStack {
                Spacer()
                Image("icon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Spacer()
            }
            
            Text("upload_real_photo_ecg_9".localized(language))
                .foregroundColor(.white)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .padding(5)
                .background(Color(hex: "d91c30").opacity(1.0))
                .cornerRadius(10)
                .padding()
            
            Spacer()
            
            VStack(spacing: 0) {
                Button {
                    withAnimation {
                        datas.view = "checkEcg"
                    }
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "heart.text.square")
                            .foregroundStyle(Color(.white))
                            .font(.system(size: 16))
                            .frame(width: 25)
                        
                        Text("Self checking")
                            .foregroundStyle(Color(.white))
                            .font(.system(size: 16))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Color(.systemGray))
                            .font(.system(size: 16))
                    }
                }
                .frame(height: 40)
                 
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundStyle(Color(.white).opacity(0.7))
                
                Button {
                    withAnimation {
                        datas.view = "auth"
                    }
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "checkmark.seal")
                            .foregroundStyle(Color(.white))
                            .font(.system(size: 16))
                            .frame(width: 25)
                        
                        Text("Booking")
                            .foregroundStyle(Color(.white))
                            .font(.system(size: 16))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Color(.systemGray))
                            .font(.system(size: 16))
                    }
                }
                .frame(height: 40)
                
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color(hex: "d91c30"))
            .cornerRadius(16)
            .shadow(color: Color(.black).opacity(0.3),radius: 5)
            .padding(.horizontal, 20)
            .padding(.top, 30)
            .padding(.bottom, 30)
            
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("gradient1"), Color("gradient2"), Color("gradient3")]), startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    HomeECGView()
}
