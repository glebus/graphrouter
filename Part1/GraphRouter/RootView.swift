//
//  RootView.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 06/04/2025.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var router: BaseRouter

    var body: some View {
        VStack {
            Text("RootView")
            Spacer()
            Button (action: {
                router.presentSheet(.sheet1)
            }, label: {
                Text("Open Sheet1")
            })
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
    }
}
