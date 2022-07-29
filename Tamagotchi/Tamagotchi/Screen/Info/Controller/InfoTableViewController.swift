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
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameLabel.text = "\(UserDefaults.standard.string(forKey: Constant.UserDefaults.UserName) ?? "대장")"
        configureNaivgationBarUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
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
        
        userNameLabel.text = "\(UserDefaults.standard.string(forKey: Constant.UserDefaults.UserName) ?? "대장")"
        userNameLabel.textColor = .foregroundColor
        userNameLabel.font = .systemFont(ofSize: 13, weight: .regular)
    }
}

// MARK: - Protocol

extension InfoTableViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        /// 내 이름 설정하기
        case 0:
            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: UserNameViewController.identifier) as? UserNameViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        /// 다마고치 변경하기
        case 1:
            let storyBoard = UIStoryboard(name: Constant.Storyboard.Select, bundle: nil)
            guard let viewController = storyBoard.instantiateViewController(withIdentifier: SelectCollectionViewController.identifier) as? SelectCollectionViewController else { return }
            viewController.viewType = .channge
            self.navigationController?.pushViewController(viewController, animated: true)
        /// 데이터 초기화
        case 2:
            let alertController = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: .alert)
            
            let cancelButton = UIAlertAction(title: "아냐!", style: .cancel)
            let okayButton = UIAlertAction(title: "웅", style: .default) { _ in
                UserDefaults.standard.removeObject(forKey: Constant.UserDefaults.TamagotchiName)
                UserDefaults.standard.removeObject(forKey: Constant.UserDefaults.TamagotchiImageName)
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
        default:
            return
        }
    }
}
