//
//  TamagochiDetailViewController.swift
//  Tamagotchi
//
//  Created by 소연 on 2022/07/24.
//

import UIKit

final class PopUpViewController: UIViewController {
    
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
    
    internal var tamagotchi: TamagotchiDataModel = TamagotchiDataModel(image: "", name: "", description: "", level: 1)
    
    internal var tamagotchiIndex: Int = 1
    
    internal var viewType: ViewType = .select
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Custom Method
    
    private func setUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.2)
        
        backView.backgroundColor = .backgroundColor
        backView.layer.cornerRadius = 8
        
        tamagotchiImageView.image = UIImage(named: tamagotchi.image)
        
        setLineView()
        setLabel()
        setButton()
    }
    
    private func setLineView() {
        [firstLineView, secondLineView].forEach {
            $0?.backgroundColor = .foregroundColor
        }
    }
    
    private func setLabel() {
        tamagotchiNameLabel.text = tamagotchi.name
        tamagotchiNameLabel.textColor = .foregroundColor
        tamagotchiNameLabel.font = .systemFont(ofSize: 13, weight: .regular)
        
        tamagotchiDescriptionLabel.text = tamagotchi.description
        tamagotchiDescriptionLabel.textColor = .foregroundColor
        tamagotchiDescriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        tamagotchiDescriptionLabel.numberOfLines = 0
        tamagotchiDescriptionLabel.textAlignment = .center
    }
    
    private func setButton() {
        [cancelButton, startButton].forEach {
            var config = UIButton.Configuration.plain()
            config.baseForegroundColor = .foregroundColor
            
            $0?.configuration = config
        }
        
        let cancelAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]
        let cancelAttributedTitle = NSAttributedString(string: "취소", attributes: cancelAttribute)
        cancelButton.setAttributedTitle(cancelAttributedTitle, for: .normal)
        
        cancelButton.backgroundColor = .foregroundColor.withAlphaComponent(0.1)
        
        let startAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]
        let startAttributedTitle = NSAttributedString(string: "\(viewType.buttonTitle)", attributes: startAttribute)
        startButton.setAttributedTitle(startAttributedTitle, for: .normal)
        startButton.setTitle("\(viewType.buttonTitle)", for: .normal)
    }
    
    // MARK: - UIButton
    
    @IBAction func touchUpCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func touchUpStartButton(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "First")
        
        UserDefaults.standard.set("\(tamagotchi.name)", forKey: Constant.UserDefaults.tamagotchiName)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: MainViewController.identifier) as? MainViewController else { return }
        viewController.tamagotchiIndex = self.tamagotchiIndex
        
        let destinationViewController = UINavigationViewController(rootViewController: viewController)
        destinationViewController.modalPresentationStyle = .fullScreen
        
        present(destinationViewController, animated: false)
    }
}
