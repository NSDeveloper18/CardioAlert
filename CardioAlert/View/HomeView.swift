//
//  HomeView.swift
//  CardioAlert
//
//  Created by Shakhzod Botirov on 21/09/24.
//

import SwiftUI
import CoreLocation
import Network

struct HomeView: View {
    @ObservedObject var datas: DataShared = .shared
    @State private var currentIndex = 1
    @State private var tappedIndex: Int? = nil
    @State var testViewTap = false
    private let manager = CLLocationManager()
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    private var language = LocalizationService.shared.language
    var body: some View {
        let items = [
            Item(img: "cvdIcon", txt: "CVD AI", view: "cvd"),
            Item(img: "ecgIcon", txt: "ECG-AI", view: "ecg"),
            Item(img: "exoIcon", txt: "EXO Cardio", view: "exo"),
            Item(img: "cardioIcon", txt: "CardioMegalia", view: "cardio"),
            Item(img: "settings", txt: "Settings", view: "settings"),
        ]
        ZStack {
            Image("settingsBack")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    Spacer()
                    Image("icon")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                    Spacer()
                }
                
                Spacer()
                
                Text("this_is_test".localized(language))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(hex: "880808"))
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .offset(y: 20)
                
                Spacer()
                
                CardStack(items, currentIndex: $currentIndex) { namedItems in
                    Button {
                        withAnimation {
                            datas.view = namedItems.view
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(hex: "#ff646c"))
                                .frame(width: 300, height: 260)
                                .shadow(color: Color.black.opacity(0.6), radius: 5)
                            
                            VStack {
                                Spacer()
                                
                                Image("\(namedItems.img)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 180)
                                
                                Spacer()
                                
                                Text(namedItems.txt.localized(language))
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 10)
                            }
                        }
                    }
                    .buttonStyle(MyButtonStyle())
                }
                .frame(height: 220)
                Spacer()
                    .alert("check_internet_connection".localized(language), isPresented: $datas.showConnection) {
                        Button("ok".localized(language), role: .cancel, action: {   })
                    }
                
            }
            // .padding(.horizontal)
//            .background(LinearGradient(gradient: Gradient(colors: [Color("gradient1"), Color("gradient2"), Color("gradient3")]), startPoint: .top, endPoint: .bottom))
        }
        .onAppear()  {
            monitor.pathUpdateHandler = { [self] path in
                if path.status == .satisfied {
                    DispatchQueue.main.async { [self] in
                        datas.showConnection = false
                        print("Connection satisfied")
                    }
                }
                else {
                    DispatchQueue.main.async { [self] in
                        datas.showConnection = true
                        print("No Connection")
                    }
                }
            }
            monitor.start(queue: queue)
        }
        
    }
}

#Preview {
    HomeView()
}
