//
//  Stack1.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 08/04/2025.
//
import SwiftUI

struct Stack1: View {
    @Environment(\.routerCoordinator) var routerCoordinator

    var body: some View {
        VStack {
            Button (action: {
                routerCoordinator.push(.stack2)
            }, label: {
                Text("Push Stack2")
            })

            Button (action: {
                routerCoordinator.presentSheetWithChildCoordinator(.sheet1)
            }, label: {
                Text("Present Sheet1")
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
        .navigationTitle("Stack1")
    }
}
