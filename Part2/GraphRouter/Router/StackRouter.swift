//
//  StackRouter.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 08/04/2025.
//
import SwiftUI

class StackRouter: BaseRouter {
    @Published var paths: [StackDestination] = []

    func push(_ destination: StackDestination) {
        paths.append(destination)
    }

    func pop() {
        if !paths.isEmpty {
            paths.removeLast()
        }
    }
}
