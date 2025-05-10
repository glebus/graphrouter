//
//  AppBaseRouter.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 06/04/2025.
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
                            .withBaseAppRouter(childRouter)
                    }
                }
            }
    }
}

extension View {
    func withBaseAppRouter(_ router: BaseRouter) -> some View {
        modifier(AppBaseRouter(router: router))
    }
}
