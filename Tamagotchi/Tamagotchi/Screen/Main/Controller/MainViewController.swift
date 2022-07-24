//
//  ViewController.swift
//  Tamagotchi
//
//  Created by 소연 on 2022/07/23.
//

import UIKit

final class MainViewController: UIViewController {

    static let identifier = "MainViewController"
    
    private var userName: String = "대장"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationUI()
    }
    
    private func setNavigationUI() {
        navigationItem.title = "\(userName)님의 다마고치"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(touchUpInfoButton))
    }
    
    // MARK: - @objc
    
    @objc func touchUpInfoButton() {
        let viewController = InfoTableViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Custom Method
    
}

