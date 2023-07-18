//
//  CustomButton.swift
//  HW7
//
//  Created by Eugene Zvyagin on 17.07.2023.
//

import UIKit

final class CustomButton: UIButton {
init(text: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        setTitle(text, for: .normal)
        setTitleColor(.black, for: .normal)
        self.backgroundColor = backgroundColor
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
