//
//  Sheet1.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 06/04/2025.
//
import SwiftUI

struct Sheet1: View {
    @ObservedObject var router: BaseRouter

    var body: some View {
        VStack {
            Text("Sheet1")
            Spacer()
            Button (action: {
                router.presentSheet(.sheet1)
            }, label: {
                Text("Open Sheet1")
            })
            .buttonStyle(.borderedProminent)

            Button (action: {
                router.close()
            }, label: {
                Text("Close Sheet1")
            })
            .buttonStyle(.borderedProminent)
            Button (action: {
                router.closeToRoot()
            }, label: {
                Text("Close to Root")
            })
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
    }
}
