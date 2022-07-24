//
//  ViewController.swift
//  Tamagotchi
//
//  Created by 소연 on 2022/07/23.
//

import UIKit

final class MainViewController: UIViewController {

    private var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationUI()
    }
    
    private func setNavigationUI() {
        navigationItem.title = "\(userName)의 다마고치"
        
    }
    
    // MARK: - @objc
    
    // MARK: - Custom Method
    
}

