//
//  ThemeManager.swift
//  HW7
//
//  Created by Eugene Zvyagin on 17.07.2023.
//

import UIKit

protocol AppTheme {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}

final class ThemeManager {
    static var currentTheme: AppTheme = WhiteTheme()
}

final class WhiteTheme: AppTheme {
    var backgroundColor: UIColor = .white
    var textColor: UIColor = .black
}

final class RedTheme: AppTheme {
    var backgroundColor: UIColor = .red
    var textColor: UIColor = .white
}

final class BlueTheme: AppTheme {
    var backgroundColor: UIColor = .blue
    var textColor: UIColor = .white
}

final class GreenTheme: AppTheme {
    var backgroundColor: UIColor = .green
    var textColor: UIColor = .black
}
