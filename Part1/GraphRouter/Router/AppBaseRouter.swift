//
//  AppBaseRouter.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 06/04/2025.
//
import SwiftUI

struct AppBaseRouter: ViewModifier {
    @EnvironmentObject var router: BaseRouter

    func body(content: Content) -> some View {
        content
            .sheet(item: $router.sheetDestination) { destination in
                switch destination {
                case .sheet1:
                    if let childRouter = router.childRouter {
                        Sheet1()
                            .withBaseAppRouter()
                            .environmentObject(childRouter)
                    } else {
                        Sheet1()
                    }
                }
            }
    }
}

extension View {
    public func withBaseAppRouter() -> some View {
        modifier(AppBaseRouter())
    }
}
