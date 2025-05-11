//
//  TabRoot.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 12/04/2025.
//
import SwiftUI

extension Tab {
    var icon: String {
        switch self {
        case .tab1:
            "house"
        case .tab2:
            "bell"
        }
    }

    var title: String {
        switch self {
        case .tab1:
            "Home"
        case .tab2:
            "Notifications"
        }
    }
}

struct TabRootView: View {
    @ObservedObject var router: TabRouter

    var body: some View {
        TabView(selection: $router.selectedTab) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                TabStack1(router: router, stackRouter: router[tab])
                    .withStackRootView(router: router, stackRouter: router[tab])
                    .tabItem {
                        Image(systemName: tab.icon)
                        Text(tab.title)
                    }
                    .tag(tab)
            }
        }
    }
}
