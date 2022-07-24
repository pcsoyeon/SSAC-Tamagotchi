//
//  SelectCollectionViewController.swift
//  Tamagotchi
//
//  Created by 소연 on 2022/07/24.
//

import UIKit

final class SelectCollectionViewController: UICollectionViewController {

    // MARK: - Property
       
    private var tamagotchis: Tamagotchi = Tamagotchi()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarUI()
        setCollectionView()
        setUI()
    }
    
    private func setNavigationBarUI() {
        navigationItem.title = "다마고치 선택하기"
    }
    
    private func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .clear
    }
    
    private func setUI() {
        view.backgroundColor = .backgroundColor
    }
}

// MARK: - Protocol

extension SelectCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tamagotchis.tamagotchi.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TamagotchiCollectionViewCell.identifier, for: indexPath) as? TamagotchiCollectionViewCell else { return UICollectionViewCell() }
        cell.setUI()
        cell.configureCell(tamagotchis.tamagotchi[indexPath.item])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item < 3 {
            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: TamagochiDetailViewController.identifier) as? TamagochiDetailViewController else { return }
            viewController.modalTransitionStyle = .coverVertical
            viewController.modalPresentationStyle = .overCurrentContext
            viewController.tamagotchi = tamagotchis.tamagotchi[indexPath.item]
            present(viewController, animated: true)
        }
    }
}
