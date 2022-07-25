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
    
    private var level: Int = 1 {
        didSet {
            tamagotchiInfoLabel.text = "LV\(level) • 밥알 \(riceCount)개 • 물방울 \(waterDropCount)개"
            
            if level > 9 {
                tamagotchiImageView.image = UIImage(named: "\(tamagotchiIndex)-\(9)")
            } else {
                tamagotchiImageView.image = UIImage(named: "\(tamagotchiIndex)-\(level)")
            }
        }
    }
    
    private var riceCount: Int = 0 {
        didSet {
            tamagotchiInfoLabel.text = "LV\(level) • 밥알 \(riceCount)개 • 물방울 \(waterDropCount)개"
            
            level = calculateLevel(riceCount: riceCount, waterDropCount: waterDropCount)
        }
    }
    
    private var waterDropCount: Int = 0 {
        didSet {
            tamagotchiInfoLabel.text = "LV\(level) • 밥알 \(riceCount)개 • 물방울 \(waterDropCount)개"
            
            level = calculateLevel(riceCount: riceCount, waterDropCount: waterDropCount)
        }
    }
    
    internal var tamagotchi: TamagotchiDataModel = TamagotchiDataModel(image: "", name: "", description: "", level: 0)
    internal var tamagotchiIndex: Int = 1
    
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
        setNavigationUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .foregroundColor
    }
    
    // MARK: - Custom Method
    
    private func setNavigationUI() {
        if let userName = UserDefaults.standard.string(forKey: "userName") {
            navigationItem.title = "\(userName)님의 다마고치"
        } else {
            navigationItem.title = "대장님의 다마고치"
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(touchUpInfoButton))
        navigationItem.rightBarButtonItem?.tintColor = .foregroundColor
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.foregroundColor]
        
        navigationController?.navigationBar.backgroundColor = .backgroundColor
    }
    
    private func setUI() {
        lineViews.forEach {
            $0.backgroundColor = .foregroundColor
        }
        view.backgroundColor = .backgroundColor
        
        setImageView()
        setLabel()
        setTextField()
        setButton()
        
        setLabel()
    }
    
    private func setImageView() {
        bubbleImageView.image = UIImage(named: "bubble")
        
        tamagotchiImageView.image = UIImage(named: "\(tamagotchiIndex)-\(level)")
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
            $0?.borderStyle = .none
            $0?.keyboardType = .numberPad
            addDoneButtonOnNumpad(textField: $0!)
        }
        
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        riceTextField.attributedPlaceholder = NSAttributedString(
            string: "밥주세용",
            attributes: [.paragraphStyle: centeredParagraphStyle]
        )
        
        waterTextField.attributedPlaceholder = NSAttributedString(
            string: "물주세용",
            attributes: [.paragraphStyle: centeredParagraphStyle]
        )
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
    
    func addDoneButtonOnNumpad(textField: UITextField) {
        let keypadToolbar: UIToolbar = UIToolbar()
        
        keypadToolbar.tintColor = .foregroundColor
        
        keypadToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: textField, action: #selector(UITextField.resignFirstResponder))
        ]
        
        keypadToolbar.sizeToFit()
        
        textField.inputAccessoryView = keypadToolbar
    }
    
    // MARK: - @objc
    
    @objc func touchUpInfoButton() {
        let storyBoard = UIStoryboard(name: "Info", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: InfoTableViewController.identifier) as? InfoTableViewController else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - IBAction
    
    @IBAction func touchUpRiceButton(_ sender: Any) {
        bubbleMessageLabel.text = bubbleMessage.randomElement()
        
        if riceTextField.hasText {
            if let riceCount = Int(riceTextField.text ?? "0") {
                if  riceCount >= 100 {
                    showToast(message: "너무 많아요🥲\n99개까지 먹을 수 있어요", font: .systemFont(ofSize: 13, weight: .regular))
                } else {
                    self.riceCount += riceCount
                }
            }
        } else {
            riceCount += 1
        }
        
        riceTextField.text = ""
    }
    
    @IBAction func touchUpWaterButton(_ sender: Any) {
        bubbleMessageLabel.text = bubbleMessage.randomElement()
        
        if waterTextField.hasText {
            if let waterDropCount = Int(waterTextField.text ?? "0") {
                if  waterDropCount >= 50 {
                    showToast(message: "너무 많아요🥲\n50개까지 먹을 수 있어요", font: .systemFont(ofSize: 13, weight: .regular))
                } else {
                    self.waterDropCount += waterDropCount
                }
            }
        } else {
            waterDropCount += 1
        }
        
        waterTextField.text = ""
    }
}
