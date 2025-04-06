//
//  RouteDestination.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 06/04/2025.
//

enum SheetDestination {
    case sheet1
}

extension SheetDestination: Identifiable {
    public var id: Self { self }
}
