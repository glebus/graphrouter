//
//  Stack1.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 08/04/2025.
//
import SwiftUI

struct Stack1: View {
    let router: BaseRouter
    let stackRouter: StackRouter

    var body: some View {
        VStack {
            Button (action: {
                stackRouter.push(.stack2)
            }, label: {
                Text("Push Stack2")
            })

            Button (action: {
                router.presetSheet(.sheet1)
            }, label: {
                Text("Present Sheet1")
            })

            Button (action: {
                router.close()
            }, label: {
                Text("Close Stack")
            })

            Button (action: {
                router.closeToRoot()
            }, label: {
                Text("Close to Root")
            })

        }
        .buttonStyle(.borderedProminent)
        .navigationTitle("Stack1")
    }
}
