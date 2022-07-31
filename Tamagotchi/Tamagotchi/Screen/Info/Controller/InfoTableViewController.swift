//
//  InfoTableViewController.swift
//  Tamagotchi
//
//  Created by 소연 on 2022/07/25.
//

import UIKit

final class InfoTableViewController: UITableViewController {
    
    // MARK: - Property
    
    static let identifier = "InfoTableViewController"
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameLabel.text = UserDefaults.standard.string(forKey: Constant.UserDefaults.UserName) ?? "대장"
        configureNaivgationBarUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureLabel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "설정", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .foregroundColor
    }
    
    // MARK: - Custom Method
    
    private func configureNaivgationBarUI() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.foregroundColor]
        navigationItem.title = "설정"
        
        navigationController?.navigationBar.backgroundColor = .backgroundColor
        navigationController?.addCustomBottomLine(color: .foregroundColor, height: 1)
    }
    
    private func configureTableView() {
        tableView.backgroundColor = .backgroundColor
    }
    
    private func configureLabel() {
        userNameLabel.text = UserDefaults.standard.string(forKey: Constant.UserDefaults.UserName) ?? "대장"
        userNameLabel.textColor = .foregroundColor
        userNameLabel.font = .systemFont(ofSize: 13, weight: .regular)
        
        switchLabel.text = "알림"
        switchLabel.textColor = .black
        switchLabel.font = .systemFont(ofSize: 13, weight: .regular)
        
        switchButton.isOn = true
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: .alert)
        
        let cancelButton = UIAlertAction(title: "아냐!", style: .cancel)
        let okayButton = UIAlertAction(title: "웅", style: .default) { _ in
            UserDefaults.standard.removeObject(forKey: Constant.UserDefaults.TamagotchiName)
            UserDefaults.standard.removeObject(forKey: Constant.UserDefaults.TamagotchiIndex)
            UserDefaults.standard.removeObject(forKey: Constant.UserDefaults.UserName)
            UserDefaults.standard.removeObject(forKey: Constant.UserDefaults.RiceCount)
            UserDefaults.standard.removeObject(forKey: Constant.UserDefaults.WaterDropCount)
            
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            
            let storyBoard = UIStoryboard(name: Constant.Storyboard.Select, bundle: nil)
            guard let viewController = storyBoard.instantiateViewController(withIdentifier: UINavigationViewController.identifier) as? UINavigationViewController else { return }
            
            sceneDelegate?.window?.rootViewController = viewController
            sceneDelegate?.window?.makeKeyAndVisible()
        }
        
        alertController.addAction(cancelButton)
        alertController.addAction(okayButton)
        
        self.present(alertController, animated: true)
    }
    
    private func pushToChangeUserName() {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: UserNameViewController.identifier) as? UserNameViewController else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func pushToChangeTamagotchi() {
        let storyBoard = UIStoryboard(name: Constant.Storyboard.Select, bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: SelectCollectionViewController.identifier) as? SelectCollectionViewController else { return }
        viewController.viewType = .channge
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Protocol

extension InfoTableViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        /// 내 이름 설정하기
        case 0:
            pushToChangeUserName()
        /// 다마고치 변경하기
        case 1:
            pushToChangeTamagotchi()
        /// 데이터 초기화
        case 2:
            showAlert()
        default:
            return
        }
    }
}
