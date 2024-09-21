//
//  AuthView.swift
//  CardioAlert
//
//  Created by Shakhzod Botirov on 21/09/24.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var datas: DataShared = .shared
    var language = LocalizationService.shared.language
    @FocusState var isKeyboardFocused: Bool
    @State private var isExistingUser = true
    @State private var email = ""
    @State private var password = ""
    @State private var reEnterPassword = ""
    var body: some View {
        VStack(spacing: 0) {
            // Heart Icon and Background Elements
            Image("icon")
                .resizable()
                .scaledToFit()
                .frame(height: 150)

            Spacer()
            
            HStack {
                ZStack {
                    HStack {
                        Spacer()
                    }
                    .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 38)
                    .background(Color(.white))
                    .clipShape(Capsule())
                    .offset(x: isExistingUser ? -90 : 90)
                    
                    HStack {
                        Button {
                            withAnimation {
                                isExistingUser = true
                            }
                            
                        } label: {
                            Text("existing".localized(language))
                                .foregroundStyle(isExistingUser ? Color.black : Color.white)
                                .font(.system(size: 15).weight(.bold))
                                .padding(.vertical, 10)
                                .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                        }
//                        .background(isExistingUser ? Color(.white) : Color.clear)
                        .frame(height: 40)
                        .clipShape(Capsule())
                        
                        
                        Button {
                            withAnimation {
                                isExistingUser = false
                            }
                        } label: {
                            Text("new".localized(language))
                                .foregroundStyle(!isExistingUser ? Color.black : Color.white)
                                .font(.system(size: 15).weight(.bold))
                                .padding(.vertical, 10)
                                .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                        }
//                        .background(!isExistingUser ? Color(.white) : Color.clear)
                        .frame(height: 40)
                        .clipShape(Capsule())
                    }
                    
                }
            }
            .background(Color.black.opacity(0.1))
            .clipShape(Capsule())
            
            // Form based on the picker selection
            VStack {
                if isExistingUser {
                    existingUserForm
                } else {
                    newUserForm
                }
            }
            .frame(height: 300)
            .padding(.top, 16)
            
            Spacer()
            if !isKeyboardFocused {
                HStack {
                    Button {
                        datas.languageSheet.toggle()
                    } label: {
                        HStack {
                            
                            Image(systemName: "globe")
                                .foregroundStyle(Color(.white))
                            
                            Text("editLanguage".localized(language))
                                .foregroundStyle(Color(.white))
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(hex: "#f68e4b"), Color(hex: "f87b6f"), Color(hex: "#c74154")]), startPoint: .top, endPoint: .bottom))
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    // Existing User Login Form
    var existingUserForm: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack(spacing: 16) {
                    Image(systemName: "envelope.fill")
                        .foregroundStyle(Color(.systemGray))
                        .padding(.leading, 8)
                        .frame(width: 20)
                    
                    TextField("enterEmail".localized(language), text: $email)
                        .foregroundStyle(.black)
                        .focused($isKeyboardFocused)
                }
                .padding(.horizontal, 8)
                .frame(height: 50)
                
                Divider()
                    .padding(.horizontal)
                
                HStack(spacing: 16) {
                    Image(systemName: "lock")
                        .foregroundStyle(Color(.systemGray))
                        .padding(.leading, 8)
                        .frame(width: 20)
                    
                    SecureField("password".localized(language), text: $password)
                        .foregroundStyle(.black)
                        .focused($isKeyboardFocused)
                }
                .padding(.horizontal, 8)
                .frame(height: 50)
            }
            .padding(.top, 16)
            .padding(.bottom, 50)
            .background(.white)
            .cornerRadius(20)
            .padding(.horizontal, 16)
            .overlay() {
                VStack {
                    Spacer()
                    Button(action: {
                        // Login action
                    }) {
                        HStack {
                            Spacer()
                            Text("signIn".localized(language))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding()
                        .frame(height: 50)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.pink]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .padding(.horizontal, 50)
                        .shadow(color: Color(.black).opacity(0.2), radius: 4, x: 0, y: -3)
                    }
                }
                .offset(x: 0, y: 25)
            }
            
            Button(action: {
                // Forgot password action
            }) {
                Text("forgotPassword".localized(language))
                    .font(.system(size: 16).weight(.semibold))
                    .foregroundColor(.white)
            }
            .padding(.top, 40)
            
            Spacer()
        }
        .frame(height: 300)
    }
    
    // New User Signup Form
    var newUserForm: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack(spacing: 16) {
                    Image(systemName: "envelope.fill")
                        .foregroundStyle(Color(.systemGray))
                        .padding(.leading, 8)
                        .frame(width: 20)
                    
                    TextField("enterEmail".localized(language), text: $email)
                        .foregroundStyle(.black)
                        .focused($isKeyboardFocused)
                }
                .padding(.horizontal, 8)
                .frame(height: 50)
                
                Divider()
                    .padding(.horizontal)
                
                HStack(spacing: 16) {
                    Image(systemName: "lock")
                        .foregroundStyle(Color(.systemGray))
                        .padding(.leading, 8)
                        .frame(width: 20)
                    
                    SecureField("password".localized(language), text: $password)
                        .foregroundStyle(.black)
                        .focused($isKeyboardFocused)
                }
                .padding(.horizontal, 8)
                .frame(height: 50)
                
                Divider()
                    .padding(.horizontal)
                
                HStack(spacing: 16) {
                    Image(systemName: "lock")
                        .foregroundStyle(Color(.systemGray))
                        .padding(.leading, 8)
                        .frame(width: 20)
                    
                    SecureField("re-enter".localized(language), text: $reEnterPassword)
                        .foregroundStyle(.black)
                        .focused($isKeyboardFocused)
                }
                .padding(.horizontal, 8)
                .frame(height: 50)
            }
            .padding(.top, 16)
            .padding(.bottom, 50)
            .background(.white)
            .cornerRadius(20)
            .padding(.horizontal, 16)
            .overlay() {
                VStack {
                    Spacer()
                    Button(action: {
                        // Login action
                    }) {
                        HStack {
                            Spacer()
                            Text("signUp".localized(language))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding()
                        .frame(height: 50)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.pink]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .padding(.horizontal, 50)
                        .shadow(color: Color(.black).opacity(0.2), radius: 4, x: 0, y: -3)
                    }
                }
                .offset(x: 0, y: 25)
            }
            
            Spacer()
        }
        .padding(.bottom, 16)
        .frame(height: 300)
    }
}

#Preview {
    AuthView()
}
