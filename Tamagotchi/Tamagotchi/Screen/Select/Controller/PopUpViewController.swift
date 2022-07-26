//
//  TamagochiDetailViewController.swift
//  Tamagotchi
//
//  Created by 소연 on 2022/07/24.
//

import UIKit

final class PopUpViewController: UIViewController {

    // MARK: - UI Property
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var tamagotchiImageView: UIImageView!
    @IBOutlet weak var tamagotchiNameLabel: UILabel!
    
    @IBOutlet weak var firstLineView: UIView!
    
    @IBOutlet weak var tamagotchiDescriptionLabel: UILabel!
    
    @IBOutlet weak var secondLineView: UIView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - Property
    
    var tamagotchi: TamagotchiDataModel = TamagotchiDataModel(image: "", name: "", description: "", level: 1)
    
    var tamagotchiIndex: Int = 1
    
    var viewType: ViewType = .select
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Custom Method
    
    private func configureUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.2)
        
        backView.backgroundColor = .backgroundColor
        backView.layer.cornerRadius = 8
        
        tamagotchiImageView.image = UIImage(named: tamagotchi.image)
        
        configureLineView()
        configureLabel()
        configureButton()
    }
    
    private func configureLineView() {
        [firstLineView, secondLineView].forEach {
            $0?.backgroundColor = .foregroundColor
        }
    }
    
    private func configureLabel() {
        tamagotchiNameLabel.text = tamagotchi.name
        tamagotchiNameLabel.textColor = .foregroundColor
        tamagotchiNameLabel.font = .pretendard(type: .regular, size: 13)
        
        tamagotchiDescriptionLabel.text = tamagotchi.description
        tamagotchiDescriptionLabel.textColor = .foregroundColor
        tamagotchiDescriptionLabel.font = .pretendard(type: .regular, size: 14)
        tamagotchiDescriptionLabel.numberOfLines = 0
        tamagotchiDescriptionLabel.textAlignment = .center
    }
    
    private func configureButton() {
        [cancelButton, startButton].forEach {
            var config = UIButton.Configuration.plain()
            config.baseForegroundColor = .foregroundColor
            
            $0?.configuration = config
        }
        
        let cancelAttribute = [NSAttributedString.Key.font: UIFont.pretendard(type: .regular, size: 13)]
        let cancelAttributedTitle = NSAttributedString(string: "취소", attributes: cancelAttribute)
        cancelButton.setAttributedTitle(cancelAttributedTitle, for: .normal)
        
        cancelButton.backgroundColor = .foregroundColor.withAlphaComponent(0.1)
        
        let startAttribute = [NSAttributedString.Key.font: UIFont.pretendard(type: .regular, size: 13)]
        let startAttributedTitle = NSAttributedString(string: "\(viewType.buttonTitle)", attributes: startAttribute)
        startButton.setAttributedTitle(startAttributedTitle, for: .normal)
        startButton.setTitle("\(viewType.buttonTitle)", for: .normal)
    }
    
    // MARK: - UIButton
    
    @IBAction func touchUpCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func touchUpStartButton(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: Constant.UserDefaults.First)
        
        UserDefaults.standard.set("\(tamagotchi.name)", forKey: Constant.UserDefaults.TamagotchiName)
        
        let storyBoard = UIStoryboard(name: Constant.Storyboard.Main, bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: MainViewController.reuseIdentifier) as? MainViewController else { return }
        viewController.tamagotchiIndex = self.tamagotchiIndex
        
        let destinationViewController = UINavigationViewController(rootViewController: viewController)
        destinationViewController.modalPresentationStyle = .fullScreen
        
        present(destinationViewController, animated: false)
    }
}
