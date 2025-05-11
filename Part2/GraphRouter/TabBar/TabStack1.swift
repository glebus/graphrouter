//
//  TabStack1.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 13/04/2025.
//
import SwiftUI

struct TabStack1: View {
    let router: TabRouter
    let stackRouter: StackRouter

    var body: some View {
        VStack {
            Button (action: {
                stackRouter.push(.tabStack2)
            }, label: {
                Text("Push Stack2")
            })
            .buttonStyle(.borderedProminent)
        }
        .toolbar {
            ToolbarItem {
                Button (action: {
                    router.presetSheet(.stack1, childRouter: StackRouter())
                }, label: {
                    Image(systemName: "square.and.pencil")
                })
            }
        }
        .navigationTitle("\(router.selectedTab.title): Stack1")
    }
}
