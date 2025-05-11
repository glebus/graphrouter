//
//  Sheet1.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 06/04/2025.
//
import SwiftUI

struct Sheet1: View {
    let router: BaseRouter

    var body: some View {
        VStack {
            Text("Sheet1")
            Spacer()

            Button (action: {
                router.presetSheet(.stack1, childRouter: StackRouter())
            }, label: {
                Text("Open Stack1")
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
