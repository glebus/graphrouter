//
//  TabRouter.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 12/04/2025.
//
import SwiftUI

class TabRouter: BaseRouter {
    @Published var selectedTab: Tab = .tab1
    @Published var routers: [Tab: StackRouter]

    subscript(tab: Tab) -> StackRouter {
        get { routers[tab, default: StackRouter()] }
        set { routers[tab] = newValue }
    }

    override init() {
        self.routers = Dictionary(uniqueKeysWithValues: Tab.allCases.map { ($0, StackRouter()) })
    }
}
