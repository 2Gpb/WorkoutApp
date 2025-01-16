//
//  TrainViewController.swift
//  WorkoutApp
//
//  Created by Peter on 09.12.2023.
//

import UIKit

final class TrainViewController: UIViewController {
    // MARK: - Constant
    private enum Constant {
        enum Collection {
            static let cellHeight = 140.0
            static let cellWidth = 335
            static let sectionInsets = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
            static let lineSpacing = 20.0
            static let interitemSpacing = 1.0
        }
    }
    
    // MARK: - Private variables
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    // MARK: - Private fields
    private let trainings = ["Strength", "Cardio", "Fitness"]
    private let workouts = ["35 workout", "12 workout", "27 workout"]
    private let images = ["Gym1", "Gym2", "Gym3"]
    private let mainTitle = UILabel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = UIColor(named: "BackColor")

        setUpTitle()
        setUpCollection()
    }
    
    private func setUpCollection() {
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(TrainCollectionCell.self, forCellWithReuseIdentifier: TrainCollectionCell.identifier)
        collectionView.alwaysBounceVertical = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let collectionConsraints = [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ]
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate(collectionConsraints)
    }
    
    private func setUpTitle() {
        mainTitle.text = "Choose your Training program"
        mainTitle.numberOfLines = 2
        mainTitle.textColor = .white
        mainTitle.textAlignment = .center
        mainTitle.font = .boldSystemFont(ofSize: 32)
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let mainTitleConstraints = [
            mainTitle.widthAnchor.constraint(equalToConstant: 250),
            mainTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
            
        ]
        
        view.addSubview(mainTitle)
        NSLayoutConstraint.activate(mainTitleConstraints)
    }
}

// MARK: - UICollectionViewDataSource
extension TrainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        trainings.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TrainCollectionCell.identifier,
                for: indexPath
            ) as? TrainCollectionCell else { return UICollectionViewCell() }

        cell.configure(text: trainings[indexPath.item], img: images[indexPath.item], labelSub: workouts[indexPath.item])

            return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TrainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthPeritem = view.frame.width - 60
        
        return CGSize(width: widthPeritem, height: Constant.Collection.cellHeight)
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        Constant.Collection.sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constant.Collection.interitemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constant.Collection.lineSpacing
    }
}
