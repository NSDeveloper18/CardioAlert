//
//  BottomViewModifier.swift
//  CardioAlert
//
//  Created by Shakhzod Botirov on 21/09/24.
//

import SwiftUI

struct BottomViewModifier: ViewModifier {
    @State private var sheetHeight: CGFloat = .zero
    @State private var selectedDetent: PresentationDetent = .medium

    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { geometry in
                    Color.clear.preference(key: InnerHeightPreferenceKey.self, value: geometry.size.height)
                }
            }
            .onPreferenceChange(InnerHeightPreferenceKey.self) { newHeight in
                sheetHeight = newHeight
                selectedDetent = .height(sheetHeight)
            }
            .presentationDetents([.height(sheetHeight)], selection: $selectedDetent)
    }
}

struct InnerHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


struct SheetMiddleLargeModifier: ViewModifier {
    @State private var sheetHeight: CGFloat = 1000
    @State private var selectedDetent: PresentationDetent = .medium
    @ObservedObject var datas: DataShared = .shared
    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { geometry in
                    Color.clear.preference(key: InnerHeightPreferenceKey.self, value: geometry.size.height)
                }
            }
            .onChange(of: selectedDetent, perform: { value in
                if selectedDetent == .large {

                }
                else {

                }
                
            })
            .onPreferenceChange(InnerHeightPreferenceKey.self) { newHeight in
                // for disable change height bigger
                if sheetHeight > newHeight {
                    sheetHeight = newHeight
                    selectedDetent = .height(sheetHeight)
                }
            }
            .presentationDetents([.height(sheetHeight), .large], selection: $selectedDetent)
           
    }
}
