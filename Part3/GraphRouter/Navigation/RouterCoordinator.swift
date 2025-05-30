//
//  RouterCoordinator.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 17/05/2025.
//
import SwiftUI

class RouterCoordinator {
    private(set) var sheetRouter: SheetRouter
    private(set) var stackRouter: StackRouter?
    private(set) var tabRouter: TabRouter?

    weak var parentCoordinator: RouterCoordinator?
    private(set) var childCoordinator: RouterCoordinator?

    // MARK: - Initialization

    // Sheet-only coordinator
    init(sheetRouter: SheetRouter) {
        self.sheetRouter = sheetRouter
    }

    init(sheetRouter: SheetRouter = SheetRouter(), tabRouter: TabRouter) {
        self.sheetRouter = sheetRouter
        self.stackRouter = nil
        self.tabRouter = tabRouter
    }

    // Custom coordinator with multiple routers
    init(sheetRouter: SheetRouter = SheetRouter(), stackRouter: StackRouter) {
        self.sheetRouter = sheetRouter
        self.stackRouter = stackRouter
        self.tabRouter = nil
    }

    // MARK: - Sheet Presentation
    
    func presentSheet(_ destination: SheetDestination) {
        sheetRouter.presetSheet(destination)
    }
    
    func presentSheetWithChildCoordinator(_ destination: SheetDestination, childSheetRouter: SheetRouter = SheetRouter()) {
        let newChildCoordinator = RouterCoordinator(sheetRouter: childSheetRouter)
        childCoordinator = newChildCoordinator
        newChildCoordinator.parentCoordinator = self

        sheetRouter.presetSheet(destination)
    }
    
    func presentSheetWithStackNavigation(_ destination: SheetDestination, childSheetRouter: SheetRouter = SheetRouter(), childStackRouter: StackRouter = StackRouter()) {
        let newChildCoordinator = RouterCoordinator(
            sheetRouter: childSheetRouter,
            stackRouter: childStackRouter
        )
        childCoordinator = newChildCoordinator
        newChildCoordinator.parentCoordinator = self
        
        sheetRouter.presetSheet(destination)
    }
    
    func dismissSheet() {
        sheetRouter.close()
    }

    func dismiss() {
        parentCoordinator?.dismissSheet()
        parentCoordinator?.childCoordinator = nil
    }

    func dismissAllToRoot() {
        if let parentCoordinator = parentCoordinator {
            parentCoordinator.dismissAllToRoot()
        } else {
            sheetRouter.close()
            childCoordinator = nil
        }
    }
    
    // MARK: - Stack Navigation
    
    func push(_ destination: StackDestination) {
        getCurrentStackRouter()?.push(destination)
    }
    
    func pop() {
        getCurrentStackRouter()?.pop()
    }
    
    // MARK: - Tab Navigation
    
    func switchTab(to tab: Tab) {
        guard let tabRouter = tabRouter else { return }
        tabRouter.switchTab(to: tab)
    }
    
    func pushInTab(_ destination: StackDestination, tab: Tab) {
        guard let tabRouter = tabRouter else { return }

        tabRouter[tab].push(destination)
    }
    
    func popInTab(tab: Tab) {
        guard let tabRouter = tabRouter else { return }

        tabRouter[tab].pop()
    }
    
    // MARK: - Helper Methods
    
    func getCurrentStackRouter() -> StackRouter? {
        if let stackRouter = stackRouter {
            return stackRouter
        } else if let tabRouter = tabRouter {
            return tabRouter[tabRouter.selectedTab]
        }
        return nil
    }

    func getRootCoordinator() -> RouterCoordinator {
        var current: RouterCoordinator = self
        while let parent = current.parentCoordinator {
            current = parent
        }
        return current
    }
}
