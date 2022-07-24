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
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNaivgationBarUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "설정", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .foregroundColor
    }
    
    // MARK: - Custom Method
    
    private func setNaivgationBarUI() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.foregroundColor]
        
        navigationItem.title = "설정"
    }
    
    private func setUI() {
        view.backgroundColor = .backgroundColor
        tableView.backgroundColor = .backgroundColor
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
            let viewController = UIViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        /// 데이터 초기화
        case 2:
            let alertController = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: .alert)
            
            let cancelButton = UIAlertAction(title: "아냐!", style: .cancel)
            let okayButton = UIAlertAction(title: "웅", style: .default)
            
            alertController.addAction(cancelButton)
            alertController.addAction(okayButton)
            
            self.present(alertController, animated: true)
        default:
            return
        }
    }
}
