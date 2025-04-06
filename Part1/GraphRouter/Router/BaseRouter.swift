//
//  BaseRouter.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 06/04/2025.
//
import SwiftUI

class BaseRouter: ObservableObject {
    @Published var sheetDestination: SheetDestination?

    weak var parentRouter: BaseRouter?
    var childRouter: BaseRouter?

    func presentSheet(_ destination: SheetDestination, router: BaseRouter? = BaseRouter()) {
        childRouter = router
        childRouter?.parentRouter = self
        sheetDestination = destination
    }

    func close() {
        sheetDestination = nil
        parentRouter?.sheetDestination = nil
        parentRouter?.childRouter = nil
    }

    func closeToRoot() {
        if let parentRouter {
            parentRouter.closeToRoot()
        } else {
            sheetDestination = nil
        }
    }
}
