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
    @IBOutlet weak var tamagotchiNameLabel: UILabel!
    
    // MARK: - Custom Method
    
    internal func setUI() {
        contentView.backgroundColor = .clear
        
        tamagotchiImageView.layer.cornerRadius = tamagotchiImageView.frame.width / 2

        tamagotchiNameLabel.font = .systemFont(ofSize: 13, weight: .regular)
        tamagotchiNameLabel.textColor = .foregroundColor
        tamagotchiNameLabel.sizeToFit()
        tamagotchiNameLabel.layer.borderColor = UIColor.foregroundColor.cgColor
        tamagotchiNameLabel.layer.borderWidth = 1
        tamagotchiNameLabel.layer.cornerRadius = 3
    }
    
    internal func configureCell(_ data: TamagotchiDataModel) {
        tamagotchiImageView.image = UIImage(named: data.image)
        
        tamagotchiNameLabel.text = "  \(data.name)  "
    }
    
}
