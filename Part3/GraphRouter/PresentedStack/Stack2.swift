//
//  Stack2.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 08/04/2025.
//
import SwiftUI

struct Stack2: View {
    @Environment(\.routerCoordinator) var routerCoordinator

    var body: some View {
        VStack {
            Button (action: {
                routerCoordinator.presentSheetWithStackNavigation(.stack1)
            }, label: {
                Text("Present Stack1")
            })

            Button (action: {
                routerCoordinator.dismiss()
            }, label: {
                Text("Close Stack")
            })

            Button (action: {
                routerCoordinator.dismissAllToRoot()
            }, label: {
                Text("Close to Root")
            })
        }
        .buttonStyle(.borderedProminent)
        .navigationTitle("Stack2")
    }
}
