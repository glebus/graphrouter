//
//  AppBaseRouter.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 13/04/2025.
//
import SwiftUI

struct AppBaseRouter: ViewModifier {
    @Environment(\.routerCoordinator) var routerCoordinator
    @ObservedObject var router: SheetRouter

    func body(content: Content) -> some View {
        content
            .sheet(item: $router.sheetDestination) { destination in
                switch destination {
                case .sheet1:
                    if let childRouterCoordinator = routerCoordinator.childCoordinator {
                        Sheet1()
                            .withAppBaseRouter(childRouterCoordinator.sheetRouter)
                            .environment(\.routerCoordinator, childRouterCoordinator)
                    }
                case .stack1:
                    if let childRouterCoordinator = routerCoordinator.childCoordinator,
                        let stackRouter = childRouterCoordinator.stackRouter {
                        Stack1()
                            .withStackRootView(stackRouter: stackRouter)
                            .withAppBaseRouter(childRouterCoordinator.sheetRouter)
                            .environment(\.routerCoordinator, childRouterCoordinator)
                    }
                }
            }
    }
}

extension View {
    func withAppBaseRouter(_ sheetRouter: SheetRouter) -> some View {
        modifier(AppBaseRouter(router: sheetRouter))
    }
}

struct RouterCoordinatorKey: EnvironmentKey {
    static let defaultValue: RouterCoordinator = .init(sheetRouter: SheetRouter())
}

extension EnvironmentValues {
    var routerCoordinator: RouterCoordinator {
        get { self[RouterCoordinatorKey.self] }
        set { self[RouterCoordinatorKey.self] = newValue }
    }
}
