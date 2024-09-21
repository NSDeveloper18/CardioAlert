//
//  HomeCVDView.swift
//  CardioAlert
//
//  Created by Shakhzod Botirov on 21/09/24.
//

import SwiftUI

struct HomeCVDView: View {
    @ObservedObject var datas: DataShared = .shared
    var language = LocalizationService.shared.language
    @ObservedObject var locationManagerSharing = LocationManager.shared
    var body: some View {
        ZStack {
            Image("settingsBack")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
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
                .padding(.horizontal, 32)
                
                HStack {
                    Spacer()
                    Image("icon")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                    Spacer()
                }
                
                Text("upload_real_photo_ecg_9".localized(language))
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                    .padding(12)
                    .background(.white)
                    .cornerRadius(16)
                    .shadow(color: Color(.black).opacity(0.3),radius: 5)
                    .padding(.horizontal, 30)
                    .offset(y: 100)
                
                Spacer()
                
                VStack(spacing: 0) {
                    Button {
                       
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "heart.text.square")
                                .foregroundStyle(Color(.black))
                                .font(.system(size: 16))
                                .frame(width: 25)
                            
                            Text("Start the test")
                                .foregroundStyle(Color(.black))
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
                        .foregroundStyle(Color(.black).opacity(0.7))
                        .padding(.leading, 30)
                    
                    Button {

                    } label: {
                        HStack(spacing: 8) {
                            Image("info")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 20)
                            
                            Text("About")
                                .foregroundStyle(Color(.black))
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
                .background(Color(.white))
                .cornerRadius(16)
                .shadow(color: Color(.black).opacity(0.3),radius: 6)
                .padding(.horizontal, 36)
                .padding(.top, 30)
                .padding(.bottom, 30)
                
            }
        }
    }
}

#Preview {
    HomeCVDView()
}
