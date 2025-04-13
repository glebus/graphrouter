//
//  RouteDestination.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 06/04/2025.
//

enum SheetDestination {
    case sheet1
    case stack1
}

extension SheetDestination: Identifiable {
    public var id: Self { self }
}

enum StackDestination {
    case stack2
    case tabStack2
}

enum Tab: Int, CaseIterable {
    case tab1
    case tab2
}
