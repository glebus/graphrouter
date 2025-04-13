//
//  SheetRouter.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 13/04/2025.
//
import SwiftUI

class BaseRouter: ObservableObject {
    weak var parentRouter: BaseRouter?
    var childRouter: BaseRouter?

    @Published var sheetDestination: SheetDestination?

    func presetSheet(_ destination: SheetDestination, childRouter: BaseRouter = BaseRouter()) {
        self.childRouter = childRouter
        childRouter.parentRouter = self
        sheetDestination = destination
    }

    func close() {
        parentRouter?.sheetDestination = nil
        parentRouter?.childRouter = nil
    }

    func closeToRoot() {
        if parentRouter != nil {
            parentRouter?.closeToRoot()
        } else {
            sheetDestination = nil
        }
    }
}
