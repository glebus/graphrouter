//
//  AppBaseRouter.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 13/04/2025.
//
import SwiftUI

struct AppBaseRouter: ViewModifier {
    @ObservedObject var router: BaseRouter

    func body(content: Content) -> some View {
        content
            .sheet(item: $router.sheetDestination) { destination in
                switch destination {
                case .sheet1:
                    if let childRouter = router.childRouter {
                        Sheet1(router: childRouter)
                            .withAppBaseRouter(childRouter)
                    }
                case .stack1:
                    if let childRouter = router.childRouter as? StackRouter {
                        Stack1(router: childRouter, stackRouter: childRouter)
                            .withStackRootView(router: childRouter, stackRouter: childRouter)
                            .withAppBaseRouter(childRouter)
                    }
                }
            }
    }
}

extension View {
    func withAppBaseRouter(_ router: BaseRouter) -> some View {
        modifier(AppBaseRouter(router: router))
    }
}
