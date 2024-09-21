//
//  SelfCheckECGView.swift
//  CardioAlert
//
//  Created by Shakhzod Botirov on 21/09/24.
//

import SwiftUI
import PhotosUI

struct SelfCheckECGView: View {
    @ObservedObject var datas: DataShared = .shared
    @ObservedObject var PhotoUpload: GetApiECG = .shared
    @State private var waiting = false
    @State private var pickPicture = false
    @State private var PhotoPicker = false
    @State private var showAbout = false
    var language = LocalizationService.shared.language
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        withAnimation {
                            datas.view = "ecg"
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
                
                Spacer()
                
                VStack {
                    
                    VStack {
                        if datas.ImagePickECG9 == Image("photoEx") {
                            Text("upload_photo".localized(language))
                                .foregroundColor(Color(hex: "d91c30"))
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                            ZStack {
                                datas.ImagePickECG9
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                            }
                            .scaledToFit()
                            .frame(width: 220)
                            .padding(2)
                            .background(Color(hex: "d91c30").opacity(0.6))
                            .cornerRadius(10)
                        }
                        else {
                            Text("selected_photo".localized(language))
                                .foregroundColor(Color(hex: "d91c30"))
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                            ZStack {
                                datas.ImagePickECG9
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                                    .frame(width: 250, height: 250)
                                if datas.waiting {
                                    LottieView(fileName: "loader")
                                        .frame(width: 250, height: 250)
                                }
                            }
                            .frame(width: 250, height: 250)
                        }
                    }
                    .padding(.top, 50)
                    .onTapGesture {
                        if datas.ImagePickECG9 == Image("photoEx") {
                            datas.largeImage = Image("photoEx")
                        }
                        else {
                            datas.largeImage = datas.ImagePickECG9
                        }
                        withAnimation {
                            datas.showLargeImage.toggle()
                        }
                    }
                    
                    Image(systemName: "arrowshape.up")
                        .foregroundColor(Color(hex: "d91c30"))
                        .padding(.top, 5)
                        .font(.title2)
                    
                    Text("upload_real_photo_ecg_9".localized(language))
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
                        .padding(8)
                        .background(Color(hex: "d91c30").opacity(1.0))
                        .cornerRadius(10)
                        .padding()
                    
                    Spacer()
                    
                    VStack(spacing: 2) {
                        HStack(spacing: 2) {
                            HStack {
                                Image("folder")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .foregroundStyle(.white)
                                PhotosPicker(selection: $datas.ImageItemECG9, matching: .images) {
                                    Text("select_photo".localized(language))
                                        .fixedSize(horizontal: true, vertical: false)
                                }
                            }
                            .padding()
                            .background(Color(hex: "d91c30"))
                            .foregroundColor(.white)
                            .cornerRadius(15, corners: [.topLeft])
                            
                            Button {
                                if datas.ImagePickECG9 == Image("photoEx") {
                                    pickPicture.toggle()
                                }
                                else {
                                    pickPicture = false
                                    datas.waiting = true
                                    PhotoUpload.uploadImageToServer()
                                }
                            } label: {
                                HStack {
                                    Spacer()
                                    Image("magnify")
                                        .renderingMode(.template)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20)
                                        .foregroundStyle(.white)
                                    Text("get_result".localized(language))
                                        .fixedSize(horizontal: true, vertical: false)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .padding()
                                .background(Color(hex: "d91c30"))
                                .foregroundColor(.black)
                                .cornerRadius(15, corners: [.topRight])
                                
                                
                            }
                        }
                        
                        Button {
                            showAbout.toggle()
                        } label: {
                            HStack {
                                Spacer()
                                Image("info")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .foregroundStyle(.white)
                                Text("about_ekg_title9".localized(language))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding()
                            .background(Color(hex: "d91c30"))
                            .cornerRadius(15, corners: [.bottomRight, .bottomLeft])
                        }
                    }
                    .padding()
                    
                }
                
                .sheet(isPresented: $showAbout) {
                    AboutEKG_9View()
                }
                
                .onChange(of: datas.ImageItemECG9) { _ in
                    Task {
                        if let data = try? await datas.ImageItemECG9?.loadTransferable(type: Data.self) {
                            if let uiImage = UIImage(data: data) {
                                datas.ImagePickECG9 = Image(uiImage: uiImage)
                                return
                                
                            }
                        }
                        print("Failed")
                    }
                }
                
                .alert("please_select_photo".localized(language), isPresented: $pickPicture, actions: {
                    Button("ok".localized(language), role: .cancel, action: {
                        
                    })
                })
                
                .alert("result_of_photo".localized(language), isPresented: $datas.showResultPhotoPickECG9, actions: {
                    Button("ok".localized(language), role: .cancel, action: {
                        
                    })
                }, message: {
                    Text("class-\(datas.predicted_class_index)".localized(language))
                        .multilineTextAlignment(.leading)
                })
            }
            .padding(.horizontal, 16)
            .background(LinearGradient(gradient: Gradient(colors: [Color("gradient1"), Color("gradient2"), Color("gradient3")]), startPoint: .top, endPoint: .bottom))
            
            LargeImageView()
                .scaleEffect(self.datas.showLargeImage ? 1.0 : 0.0)
        }
    }
}

#Preview {
    SelfCheckECGView()
}
