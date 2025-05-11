//
//  StackRootView.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 13/04/2025.
//
import SwiftUI

struct AppStackRouter: ViewModifier {
    let router: BaseRouter
    @ObservedObject var stackRouter: StackRouter

    func body(content: Content) -> some View {
        NavigationStack(path: $stackRouter.paths) {
            content
                .navigationDestination(for: StackDestination.self) { destination in
                    switch destination {
                    case .stack2:
                        Stack2(router: router)
                    case .tabStack2:
                        if let tabRouter = router as? TabRouter {
                            TabStack2(router: tabRouter, stackRouter: stackRouter)
                        }
                    }
                }
        }
    }
}

extension View {
    func withStackRootView(router: BaseRouter, stackRouter: StackRouter) -> some View {
        modifier(AppStackRouter(router: router, stackRouter: stackRouter))
    }
}
