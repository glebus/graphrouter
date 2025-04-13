//
//  AppBaseRouter.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 13/04/2025.
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
                            .withAppBaseRouter()
                            .environmentObject(childRouter)
                    } else {
                        EmptyView()
                    }
                case .stack1:
                    if let childRouter = router.childRouter as? StackRouter {
                        Stack1()
                            .withStackRootView()
                            .environmentObject(childRouter)
                            .withAppBaseRouter()
                            .environmentObject(childRouter as BaseRouter)
                    } else {
                        EmptyView()
                    }
                }
            }
    }
}

extension View {
    public func withAppBaseRouter() -> some View {
        modifier(AppBaseRouter())
    }
}
