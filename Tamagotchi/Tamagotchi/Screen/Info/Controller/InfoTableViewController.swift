//
//  InfoTableViewController.swift
//  Tamagotchi
//
//  Created by 소연 on 2022/07/25.
//

import UIKit

final class InfoTableViewController: UITableViewController {
    
    static let identifier = "InfoTableViewController"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNaivgationBarUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
        case 0:
            let viewController = UIViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        case 1:
            let viewController = UIViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
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
