//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Peter on 07.12.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    //MARK: - Constant
    
    private enum Constant {
        enum Collection {
            static let cellHeight = 150.0
            static let cellWidth = 300
            static let sectionInsets = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
            static let lineSpacing = 20.0
            static let interitemSpacing = 1.0
        }
    }
    
    //MARK: - Properties
    
    let colors = ["Greenn", "LightGrayy"]
    let titles = ["Calories", "Weight", "Water", "Steps"]
    let images = ["fork.knife.circle.fill", "chart.xyaxis.line", "waterbottle.fill", "figure.walk.circle.fill"]
    let subTitles = ["1300 cal", "67 kg", "1.7 liters", "8546 steps"]
    
    //MARK: - SubViews
    
    private let mainTitle = UILabel()
    private let searchButton = UIButton()
    private let headerStackView = UIStackView()
    private let subTitle = UILabel()
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let checkButton = UIButton()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //MARK: - SetUp
    
    private func setUp() {
        
        view.backgroundColor = UIColor(named: "BackColor")
        
        setUpMainTitle()
        setUpSearchButton()
        setUpHeaderStackView()
        setUpSubTitle()
        setUpCheckButton()
        setUpCollection()
    }
    
    private func setUpMainTitle() {
        
        mainTitle.text = "Hello!"
        mainTitle.textColor = .white
        mainTitle.font = .systemFont(ofSize: 32, weight: .bold)
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpSearchButton() {
        
        searchButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchButton.layer.cornerRadius = 20
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .black
        searchButton.backgroundColor = UIColor(named: "Greenn")
        searchButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpHeaderStackView() {
        
        headerStackView.axis = .horizontal
        headerStackView.alignment = .center
        headerStackView.distribution = .equalSpacing
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        headerStackView.addArrangedSubview(mainTitle)
        headerStackView.addArrangedSubview(searchButton)
        
        let headerStackViewConstarints = [
        
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30),
            headerStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30),
            
        ]
        
        view.addSubview(headerStackView)
        NSLayoutConstraint.activate(headerStackViewConstarints)
    }
    
    private func setUpSubTitle() {
        
        subTitle.text = "Metrics"
        subTitle.textColor = .white
        subTitle.font = .systemFont(ofSize: 22, weight: .bold)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let subTitleConstraints = [
        
            subTitle.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 40),
            subTitle.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30)
        ]
        
        view.addSubview(subTitle)
        NSLayoutConstraint.activate(subTitleConstraints)
    }
    
    private func setUpCheckButton() {
        
        checkButton.backgroundColor = UIColor(named: "Greenn")
        checkButton.setTitle("Check your health score", for: .normal)
        checkButton.setTitleColor(.black, for: .normal)
        checkButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        checkButton.layer.cornerRadius = 15
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        
        checkButton.addAction(UIAction { [weak self] _ in
            guard let self else { return }
            
            self.navigationController?.pushViewController(SoonViewController(), animated: true)
            
        }, for: .touchUpInside)
        
        
        let checkButtonConstraints = [
        
            checkButton.heightAnchor.constraint(equalToConstant: 56),
            checkButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30),
            checkButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30),
            checkButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ]
        
        view.addSubview(checkButton)
        NSLayoutConstraint.activate(checkButtonConstraints)
    }
    
    private func setUpCollection() {
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(MainCollectionCell.self, forCellWithReuseIdentifier: MainCollectionCell.identifier)
        collectionView.alwaysBounceVertical = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let collectionConsraints = [
        
            collectionView.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: checkButton.topAnchor, constant: -20),
        ]
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate(collectionConsraints)
    }
}

//MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MainCollectionCell.identifier,
                for: indexPath
            ) as? MainCollectionCell else { return UICollectionViewCell() }
            
        if indexPath.item % 4 == 0 || indexPath.item % 4 == 3 {
            cell.configure(color: colors[0], title: titles[indexPath.item], img: images[indexPath.item], label: subTitles[indexPath.item])
        } else {
            cell.configure(color: colors[1], title: titles[indexPath.item], img: images[indexPath.item], label: subTitles[indexPath.item])
        }

            return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(SoonViewController(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        let widthPeritem = view.frame.width/2 - 40

            return CGSize(width: widthPeritem, height: 185)
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
