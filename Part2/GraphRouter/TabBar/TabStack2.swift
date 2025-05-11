//
//  TabStack2.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 13/04/2025.
//
import SwiftUI

struct TabStack2: View {
    let router: TabRouter
    let stackRouter: StackRouter

    var body: some View {
        VStack {
            Button (action: {
                stackRouter.pop()
            }, label: {
                Text("Pop")
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
        .navigationTitle("\(router.selectedTab.title): Stack2")
    }
}

