//
//  TabRouter.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 12/04/2025.
//
import SwiftUI

class TabRouter: ObservableObject {
    @Published var selectedTab: Tab = .tab1
    @Published var routers: [Tab: StackRouter] = Dictionary(uniqueKeysWithValues: Tab.allCases.map { ($0, StackRouter()) })

    subscript(tab: Tab) -> StackRouter {
        get { routers[tab, default: StackRouter()] }
        set { routers[tab] = newValue }
    }

    func switchTab(to tab: Tab) {
        selectedTab = tab
    }
}
