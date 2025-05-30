//
//  StackRootView.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 13/04/2025.
//
import SwiftUI

struct AppStackRouter: ViewModifier {
    @Environment(\.routerCoordinator) var routerCoordinator
    @ObservedObject var stackRouter: StackRouter

    func body(content: Content) -> some View {
        NavigationStack(path: $stackRouter.paths) {
            content
                .navigationDestination(for: StackDestination.self) { destination in
                    switch destination {
                    case .stack2:
                        Stack2()
                    case .tabStack2:
                        TabStack2()
                    }
                }
        }
    }
}

extension View {
    func withStackRootView(stackRouter: StackRouter) -> some View {
        modifier(AppStackRouter(stackRouter: stackRouter))
    }
}
