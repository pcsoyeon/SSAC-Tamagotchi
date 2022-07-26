//
//  SelectCollectionViewController.swift
//  Tamagotchi
//
//  Created by 소연 on 2022/07/24.
//

import UIKit

enum ViewType {
    case select
    case channge
    
    var title: String {
        switch self {
        case .select:
            return "다마고치 선택하기"
        case .channge:
            return "다마고치 변경하기"
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .select:
            return "시작하기"
        case .channge:
            return "변경하기"
        }
    }
}

final class SelectCollectionViewController: UICollectionViewController {

    // MARK: - Property
    
    static let identifier = "SelectCollectionViewController"
       
    private var tamagotchis: Tamagotchi = Tamagotchi()
    
    internal var viewType: ViewType = .select {
        didSet {
            navigationItem.title = viewType.title
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
    
    // MARK: - Custom Method
    
    private func setNavigationBarUI() {
        navigationItem.title = viewType.title
    }
    
    private func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .backgroundColor
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
            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: PopUpViewController.identifier) as? PopUpViewController else { return }
            viewController.modalTransitionStyle = .coverVertical
            viewController.modalPresentationStyle = .overCurrentContext
            viewController.tamagotchi = tamagotchis.tamagotchi[indexPath.item]
            viewController.tamagotchiIndex = indexPath.item + 1
            viewController.viewType = self.viewType
            present(viewController, animated: true)
        }
    }
}
