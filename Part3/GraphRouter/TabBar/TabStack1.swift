//
//  TabStack1.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 13/04/2025.
//
import SwiftUI

struct TabStack1: View {
    @Environment(\.routerCoordinator) var routerCoordinator

    var body: some View {
        VStack {
            Button (action: {
                routerCoordinator.push(.tabStack2)
            }, label: {
                Text("Push Stack2")
            })
            .buttonStyle(.borderedProminent)
        }
        .toolbar {
            ToolbarItem {
                Button (action: {
                    routerCoordinator.presentSheetWithStackNavigation(.sheet1)
                }, label: {
                    Image(systemName: "square.and.pencil")
                })
            }
        }
        .navigationTitle("\(routerCoordinator.tabRouter?.selectedTab.title ?? ""): Stack1")
    }
}
