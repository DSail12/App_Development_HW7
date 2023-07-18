//
//  NewViewController.swift
//  HW7
//
//  Created by Eugene Zvyagin on 17.07.2023.
//

import Foundation
import UIKit

class NewViewController: UIViewController {
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate;
    func app () {appDelegate?.sendNotification()}
}
