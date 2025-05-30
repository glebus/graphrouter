//
//  TabStack2.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 13/04/2025.
//
import SwiftUI

struct TabStack2: View {
    @Environment(\.routerCoordinator) var routerCoordinator

    var body: some View {
        VStack {
            Button (action: {
                routerCoordinator.pop()
            }, label: {
                Text("Pop")
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
        .navigationTitle("\(routerCoordinator.tabRouter?.selectedTab.title ?? ""): Stack2")
    }
}

