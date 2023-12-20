//
//  NewsViewController.swift
//  WorkoutApp
//
//  Created by Peter on 10.12.2023.
//

import UIKit

final class NewsViewController: UIViewController, UICollectionViewDelegate {
    
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
    var titles: [Result] = []
    
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
        
        setUpApi()
        setUpMainTitle()
        setUpCollection()
    }
    
    private func setUpApi() {
        
        APIManager.shared.getNews()
        { [weak self] values in
            guard let self else {
                print("-self")
                return }
            
            DispatchQueue.main.async {
                self.titles = values
                self.collectionView.reloadData()
            }
        }
    }
    
    private func setUpMainTitle() {
        
        mainTitle.text = "News"
        mainTitle.textColor = .white
        mainTitle.font = .systemFont(ofSize: 32, weight: .bold)
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let titleConstraint = [
            
            mainTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mainTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitle.widthAnchor.constraint(equalToConstant: 100)
            
        ]
        
        view.addSubview(mainTitle)
        NSLayoutConstraint.activate(titleConstraint)
    }
    
    private func setUpCollection() {
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(NewsCollectionCell.self, forCellWithReuseIdentifier: NewsCollectionCell.identifier)
        collectionView.alwaysBounceVertical = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let collectionConsraints = [
            
            collectionView.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ]
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate(collectionConsraints)
    }
}
    
    //MARK: - UICollectionViewDataSource
    
    extension NewsViewController: UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            titles.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NewsCollectionCell.identifier,
                for: indexPath
            ) as? NewsCollectionCell else { return UICollectionViewCell() }
            
            if indexPath.item % 2 == 0 {
                cell.configure(color: colors[0], nameStudio: titles[indexPath.item].pubDate, nameTitle: titles[indexPath.item].title, nameAutor: titles[indexPath.item].creator?[0] ?? "-")
            } else {
                cell.configure(color: colors[1], nameStudio: titles[indexPath.item].pubDate, nameTitle: titles[indexPath.item].title, nameAutor: titles[indexPath.item].creator?[0] ?? "-")
            }
            
            return cell
        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    extension NewsViewController: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            self.navigationController?.pushViewController(SoonViewController(), animated: true)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let widthPeritem = view.frame.width - 60
            
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

