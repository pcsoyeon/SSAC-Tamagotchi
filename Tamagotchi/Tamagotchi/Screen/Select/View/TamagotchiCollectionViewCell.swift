//
//  TamagotchiCollectionViewCell.swift
//  Tamagotchi
//
//  Created by 소연 on 2022/07/24.
//

import UIKit

class TamagotchiCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifier = "TamagotchiCollectionViewCell"
    
    // MARK: - UI Property
    
    @IBOutlet weak var tamagotchiImageView: UIImageView!
    @IBOutlet weak var tamagotchiNameButton: UIButton!
    
    // MARK: - Custom Method
    
    internal func setUI() {
        contentView.backgroundColor = .clear
        
        tamagotchiImageView.layer.cornerRadius = tamagotchiImageView.frame.width / 2

        tamagotchiNameButton.layer.borderWidth = 1
        tamagotchiNameButton.layer.borderColor = UIColor.foregroundColor.cgColor
        
        tamagotchiNameButton.backgroundColor = .backgroundColor
        tamagotchiNameButton.setTitleColor(.foregroundColor, for: .normal)
        
        tamagotchiNameButton.titleLabel?.font = .systemFont(ofSize: 9, weight: .regular)
    }
    
    internal func configureCell(_ data: TamagotchiDataModel) {
        tamagotchiImageView.image = UIImage(named: data.image)
        
        tamagotchiNameButton.setTitle(data.name, for: .normal)
    }
    
}
