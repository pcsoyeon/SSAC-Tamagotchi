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
        
        tamagotchiNameButton.layer.cornerRadius = 8
        
        tamagotchiNameButton.backgroundColor = .backgroundColor
        
        var config = UIButton.Configuration.plain()
        config.baseForegroundColor = .foregroundColor
        tamagotchiNameButton.configuration = config
    }
    
    internal func configureCell(_ data: TamagotchiDataModel) {
        tamagotchiImageView.image = UIImage(named: data.image)
        
        let riceAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]
        let riceAttributedTitle = NSAttributedString(string: "\(data.name)", attributes: riceAttribute)
        tamagotchiNameButton.setAttributedTitle(riceAttributedTitle, for: .normal)
    }
    
}
