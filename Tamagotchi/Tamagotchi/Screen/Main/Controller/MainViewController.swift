//
//  ViewController.swift
//  Tamagotchi
//
//  Created by 소연 on 2022/07/23.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Property
    
    static let identifier = "MainViewController"
    
    private var userName: String = "대장"
    
    private var level: Int = 0
    private var riceCount: Int = 0
    private var waterDropCount: Int = 0
    
    internal var tamagotchi: TamagotchiDataModel = TamagotchiDataModel(image: "", name: "", description: "", level: 0)
    
    private var bubbleMessage: [String] = ["복습 합시다", "테이블 뷰 컨트롤러와 뷰 컨트롤러는 어떤 차이가 있을까요?", "배고파요. 밥 주세요.", "Github에 Push 해주세요.", "오늘도 복습하세요!!!", "1일 1커밋 하고 계신가요??"]
    
    // MARK: - UI Property
    
    @IBOutlet var lineViews: [UIView]!
    
    @IBOutlet weak var bubbleImageView: UIImageView!
    @IBOutlet weak var bubbleMessageLabel: UILabel!
    
    @IBOutlet weak var tamagotchiImageView: UIImageView!
    @IBOutlet weak var tamagotchiNameLabel: UILabel!
    @IBOutlet weak var tamagotchiInfoLabel: UILabel!
    
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    
    @IBOutlet weak var riceButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bubbleMessageLabel.text = bubbleMessage.randomElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationUI()
        setUI()
    }
    
    // MARK: - Custom Method
    
    private func setNavigationUI() {
        navigationItem.title = "\(userName)님의 다마고치"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(touchUpInfoButton))
        navigationItem.rightBarButtonItem?.tintColor = .foregroundColor
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.foregroundColor]
    }
    
    // MARK: - @objc
    
    @objc func touchUpInfoButton() {
        let viewController = InfoTableViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Custom Method
    
    private func setUI() {
        lineViews.forEach {
            $0.backgroundColor = .foregroundColor
        }
        view.backgroundColor = .backgroundColor
        
        setImageView()
        setLabel()
        setTextField()
        setButton()
    }
    
    private func setImageView() {
        bubbleImageView.image = UIImage(named: "bubble")
        tamagotchiImageView.image = UIImage(named: tamagotchi.image)
    }
    
    private func setLabel() {
        [tamagotchiNameLabel, tamagotchiInfoLabel, bubbleMessageLabel].forEach {
            $0?.textColor = .foregroundColor
            $0?.font = .systemFont(ofSize: 13, weight: .medium)
        }
        
        tamagotchiNameLabel.text = "\(tamagotchi.name)"
        tamagotchiInfoLabel.text = "LV\(level) • 밥알 \(riceCount)개 • 물방울 \(waterDropCount)개"
        
        bubbleMessageLabel.textAlignment = .center
        bubbleMessageLabel.numberOfLines = 0
    }
    
    private func setTextField() {
        [riceTextField, waterTextField].forEach {
            $0?.delegate = self
            $0?.borderStyle = .none
        }
        
        riceTextField.placeholder = "밥주세용"
        waterTextField.placeholder = "물주세용"
    }
    
    private func setButton() {
        riceButton.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        riceButton.setTitle("밥먹기", for: .normal)
        
        waterButton.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        waterButton.setTitle("물먹기", for: .normal)
        
        [riceButton, waterButton].forEach {
            $0?.layer.borderColor = UIColor.foregroundColor.cgColor
            $0?.layer.borderWidth = 1
            
            $0?.layer.cornerRadius = 8
            
            var config = UIButton.Configuration.plain()
            config.imagePadding = 5
            config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
            config.baseForegroundColor = .foregroundColor
            
            $0?.configuration = config
        }
        
        let riceAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]
        let riceAttributedTitle = NSAttributedString(string: "밥먹기", attributes: riceAttribute)
        riceButton.setAttributedTitle(riceAttributedTitle, for: .normal)
        
        let waterAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]
        let waterAttributedTitle = NSAttributedString(string: "물먹기", attributes: waterAttribute)
        waterButton.setAttributedTitle(waterAttributedTitle, for: .normal)
    }
    
    // MARK: - IBAction
    
    @IBAction func touchUpRiceButton(_ sender: Any) {
        bubbleMessageLabel.text = bubbleMessage.randomElement()
    }
    
    @IBAction func touchUpWaterButton(_ sender: Any) {
        bubbleMessageLabel.text = bubbleMessage.randomElement()
    }
}

// MARK: - UITextField Delegate

extension MainViewController: UITextFieldDelegate {
    
}
