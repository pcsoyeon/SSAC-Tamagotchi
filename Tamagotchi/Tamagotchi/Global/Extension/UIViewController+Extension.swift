//
//  ViewController+Extension.swift
//  Tamagotchi
//
//  Created by 소연 on 2022/07/25.
//

import UIKit

extension UIViewController {
    func calculateLevel(riceCount: Int, waterDropCount: Int) -> Int {
        var level: Int = 0
        let data = (riceCount / 5) + (waterDropCount / 2)
        
        if data >= 0 && data < 10 {
            level = 1
        } else if data >= 10 && data < 20 {
            level = 1
        } else if data >= 20 && data < 30 {
            level = 2
        } else if data >= 30 && data < 40 {
            level = 3
        } else if data >= 40 && data < 50 {
            level = 4
        } else if data >= 50 && data < 60 {
            level = 5
        } else if data >= 60 && data < 70 {
            level = 6
        } else if data >= 70 && data < 80 {
            level = 7
        } else if data >= 80 && data < 90 {
            level = 8
        } else if data >= 90 && data < 100 {
            level = 9
        } else {
            level = 10
        }
        
        return level
    }
    
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75,
                                               y: self.view.frame.size.height-100,
                                               width: 150,
                                               height: 35))
        
        toastLabel.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 15;
        toastLabel.clipsToBounds = true
        
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 1.0,
                       delay: 0.2,
                       options: .curveEaseOut,
                       animations: { toastLabel.alpha = 0.0 },
                       completion: {(isCompleted) in toastLabel.removeFromSuperview() })
    }
}
