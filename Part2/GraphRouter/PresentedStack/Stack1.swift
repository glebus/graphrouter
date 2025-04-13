//
//  Stack1.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 08/04/2025.
//
import SwiftUI

struct Stack1: View {
    @EnvironmentObject var router: StackRouter
    @EnvironmentObject var sheetRouter: BaseRouter

    var body: some View {
        VStack {
            Button (action: {
                router.push(.stack2)
            }, label: {
                Text("Push Stack2")
            })

            Button (action: {
                sheetRouter.presetSheet(.sheet1)
            }, label: {
                Text("Present Sheet1")
            })

            Button (action: {
                sheetRouter.close()
            }, label: {
                Text("Close Stack")
            })

            Button (action: {
                sheetRouter.closeToRoot()
            }, label: {
                Text("Close to Root")
            })

        }
        .buttonStyle(.borderedProminent)
        .navigationTitle("Stack1")
    }
}
