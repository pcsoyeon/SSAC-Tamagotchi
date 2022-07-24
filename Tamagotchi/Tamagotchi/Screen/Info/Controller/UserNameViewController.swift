//
//  UserNameViewController.swift
//  Tamagotchi
//
//  Created by 소연 on 2022/07/25.
//

import UIKit

final class UserNameViewController: UIViewController {
    
    // MARK: - Property
    
    static let identifier = "UserNameViewController"

    // MARK: - UI Property
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Custom Method
    
    private func setNavigationBarUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(touchUpSaveButton))
        navigationItem.rightBarButtonItem?.tintColor = .foregroundColor
        
        navigationItem.title = "대장님 이름 정하기"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.foregroundColor]
    }
    
    private func setUI() {
        view.backgroundColor = .backgroundColor
        setTextField()
    }
    
    private func setTextField() {
        userNameTextField.borderStyle = .none
    }
    
    // MARK: - @objc
    
    @objc func touchUpSaveButton() {
        
        // MARK: - TODO: UserDefault에 저장
        
        if let userName = userNameTextField.text {
            print(userName)
        }
    }
}
