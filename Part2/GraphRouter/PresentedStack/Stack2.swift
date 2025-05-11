//
//  Stack2.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 08/04/2025.
//
import SwiftUI

struct Stack2: View {
    let router: BaseRouter

    var body: some View {
        VStack {
            Button (action: {
                router.presetSheet(.stack1, childRouter: StackRouter())
            }, label: {
                Text("Present Stack1")
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
        .navigationTitle("Stack2")
    }
}
