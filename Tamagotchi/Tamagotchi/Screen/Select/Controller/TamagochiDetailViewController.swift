//
//  TamagochiDetailViewController.swift
//  Tamagotchi
//
//  Created by 소연 on 2022/07/24.
//

import UIKit

final class TamagochiDetailViewController: UIViewController {
    
    static let identifier = "TamagochiDetailViewController"

    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var tamagotchiImageView: UIImageView!
    @IBOutlet weak var tamagotchiNameLabel: UILabel!
    
    @IBOutlet weak var firstLineView: UIView!
    
    @IBOutlet weak var tamagotchiDescriptionLabel: UILabel!
    
    @IBOutlet weak var secondLineView: UIView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - Property
    
    internal var tamagotchi: TamagotchiDataModel = TamagotchiDataModel(image: "", name: "", description: "", level: 0)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Custom Method
    
    private func setUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        backView.backgroundColor = .backgroundColor
        backView.layer.cornerRadius = 8
        
        tamagotchiImageView.image = UIImage(named: tamagotchi.image)
        
        tamagotchiNameLabel.text = tamagotchi.name
        tamagotchiNameLabel.textColor = .foregroundColor
        tamagotchiNameLabel.font = .systemFont(ofSize: 13, weight: .regular)
        
        tamagotchiDescriptionLabel.text = tamagotchi.description
        tamagotchiDescriptionLabel.textColor = .foregroundColor
        tamagotchiDescriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        tamagotchiDescriptionLabel.numberOfLines = 0
        tamagotchiDescriptionLabel.textAlignment = .center
        
        [cancelButton, startButton].forEach {
            $0?.setTitleColor(.foregroundColor, for: .normal)
            $0?.setTitleColor(.foregroundColor, for: .highlighted)
            $0?.titleLabel?.font = .systemFont(ofSize: 10, weight: .regular)
        }
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.backgroundColor = .foregroundColor.withAlphaComponent(0.1)
        
        startButton.setTitle("시작하기", for: .normal)
        
        [firstLineView, secondLineView].forEach {
            $0?.backgroundColor = .foregroundColor
        }
    }
    
    // MARK: - UIButton
    
    @IBAction func touchUpCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func touchUpStartButton(_ sender: Any) {
        
    }
}
