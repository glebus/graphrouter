//
//  StackRootView.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 13/04/2025.
//
import SwiftUI

struct AppStackRouter: ViewModifier {
    @EnvironmentObject var router: StackRouter

    func body(content: Content) -> some View {
        NavigationStack(path: $router.paths) {
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
    public func withStackRootView() -> some View {
        modifier(AppStackRouter())
    }
}
