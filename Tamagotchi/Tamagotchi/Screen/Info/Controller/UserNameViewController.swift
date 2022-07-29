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
    
    @IBOutlet weak var warningLabel: UILabel!
    
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
        
        navigationItem.title = "대장님의 이름 정하기"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.foregroundColor]
    }
    
    private func setUI() {
        setTextField()
        setLabel()
    }
    
    private func setTextField() {
        userNameTextField.borderStyle = .none
        
        userNameTextField.text = "\(UserDefaults.standard.string(forKey: Constant.UserDefaults.UserName) ?? "대장")"
        
        userNameTextField.textColor = .foregroundColor
        userNameTextField.tintColor = .foregroundColor
        
        userNameTextField.delegate = self
    }
    
    private func setLabel() {
        warningLabel.text = "대장 이름은 2글자 이상 6글자 이하까지 가능합니다."
        warningLabel.textColor = .red
        warningLabel.font = .systemFont(ofSize: 13, weight: .medium)
    }
    
    // MARK: - @objc
    
    @objc func touchUpSaveButton() {
        if let userName = userNameTextField.text {
            UserDefaults.standard.set(userName, forKey: Constant.UserDefaults.UserName)
            self.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - Protocol

extension UserNameViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let textCount = textField.text?.count {
            warningLabel.isHidden = ((textCount <= 6) && (textCount >= 2)) ? true : false
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = (textField.text?.count)! + string.count - range.length
        return !(newLength > 6)
    }
}
