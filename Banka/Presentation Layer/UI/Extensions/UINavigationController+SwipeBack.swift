//
//  UINavigationController+SwipeBack.swift
//  Banka
//
//  Created by Alish Aidarkhan on 21.10.2022.
//

import UIKit

// Чтобы работал SwipeBack в SwiftUI
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
