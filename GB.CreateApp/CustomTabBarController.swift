//
//  CustomTabBarController.swift
//  HW7
//
//  Created by Eugene Zvyagin on 17.07.2023.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {

    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        guard let fromView = selectedViewController?.view, let toView = viewControllers?.first?.view else {
            super.setViewControllers(viewControllers, animated: animated)
            return
        }
        // Add the new view as a subview
        fromView.superview?.addSubview(toView)
        // Set the initial transform for the toView
        toView.transform = CGAffineTransform(rotationAngle: .pi / 2)
        toView.alpha = 0
        // Perform the transition animation
        UIView.animate(withDuration: 0.5, animations: {
            toView.transform = .identity
            toView.alpha = 1
            fromView.transform = CGAffineTransform(rotationAngle: -.pi / 2)
            fromView.alpha = 0
        }) { (_) in
            // Clean up after the animation completes
            fromView.transform = .identity
            fromView.alpha = 1
            toView.removeFromSuperview()
            super.setViewControllers(viewControllers, animated: false)
        }
    }
}
