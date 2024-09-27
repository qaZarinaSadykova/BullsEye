//
//  CustomSlider.swift
//  Bullseye
//
//  Created by Zarina Sadykova on 26.09.24.
//

import UIKit

class CustomSlider: UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        // Задаем высоту трека равной 10
        return CGRect(x: bounds.origin.x, y: bounds.origin.y + (bounds.size.height - 10) / 2, width: bounds.size.width, height: 10)
    }
}
