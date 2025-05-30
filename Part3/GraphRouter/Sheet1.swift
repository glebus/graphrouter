//
//  Sheet1.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 06/04/2025.
//
import SwiftUI

struct Sheet1: View {
    @Environment(\.routerCoordinator) var routerCoordinator

    var body: some View {
        VStack {
            Text("Sheet1")
            Spacer()

            Button (action: {
                routerCoordinator.presentSheetWithStackNavigation(.stack1)
            }, label: {
                Text("Open Stack1")
            })
            .buttonStyle(.borderedProminent)

            Button (action: {
                routerCoordinator.dismiss()
            }, label: {
                Text("Close Sheet1")
            })
            .buttonStyle(.borderedProminent)

            Button (action: {
                routerCoordinator.dismissAllToRoot()
            }, label: {
                Text("Close to Root")
            })
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
    }
}
