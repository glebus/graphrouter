//
//  SheetRouter.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 13/04/2025.
//
import SwiftUI

class SheetRouter: ObservableObject {
    @Published var sheetDestination: SheetDestination?

    func presetSheet(_ destination: SheetDestination) {
        sheetDestination = destination
    }

    func close() {
        sheetDestination = nil
    }
}
