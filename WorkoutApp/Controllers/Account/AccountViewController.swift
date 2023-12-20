//
//  AccountViewController.swift
//  WorkoutApp
//
//  Created by Peter on 09.12.2023.
//

import UIKit

final class AccountViewController: UIViewController {
    
    //MARK: - Constant
    
    private enum Constant {
        enum Collection {
            static let cellHeight = 80.0
            static let cellWidth = 300
            static let sectionInsets = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
            static let lineSpacing = 20.0
            static let interitemSpacing = 1.0
        }
    }
    
    //MARK: - Properties
    
    let titles = ["App settings", "Privacy", "About", "Log out"]
    let images = ["gearshape", "shield", "info.circle", "arrow.right.square.fill"]
    let subTitles = ["App permissions", "Account settings", "Know about our app", "Log out from app"]
    
    //MARK: - SubViews
    
    private let mainTitle = UILabel()
    private let avatarImg = UIImageView()
    private let label = UILabel()
    private let subLabel = UILabel()
    private let labelStack = UIStackView()
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    //MARK: - SetUp
    
    private func setUp() {
        
        view.backgroundColor = UIColor(named: "BackColor")
        
        setUpMainTitle()
        setUpAvatar()
        setUpLabel()
        setUpSubLabel()
        setUpLabelStack()
        setUpSettingsView()
    }
    
    private func setUpMainTitle() {
        
        mainTitle.text = "Settings"
        mainTitle.textColor = .white
        mainTitle.font = .boldSystemFont(ofSize: 32)
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let mainTitleConstraints = [
            
            mainTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        ]
        
        view.addSubview(mainTitle)
        NSLayoutConstraint.activate(mainTitleConstraints)
    }
    
    private func setUpAvatar() {
        
        avatarImg.image = UIImage(named: "Avatar")
        avatarImg.contentMode = .scaleAspectFill
        avatarImg.clipsToBounds = true
        avatarImg.layer.cornerRadius = 65
        avatarImg.layer.borderWidth = 2
        avatarImg.layer.borderColor = UIColor(named: "Greenn")?.cgColor
        avatarImg.translatesAutoresizingMaskIntoConstraints = false
        
        let avatarConstraints = [
            
            avatarImg.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 30),
            avatarImg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            avatarImg.heightAnchor.constraint(equalToConstant: 130),
            avatarImg.widthAnchor.constraint(equalToConstant: 130)
        ]
        
        view.addSubview(avatarImg)
        NSLayoutConstraint.activate(avatarConstraints)
    }
    
    private func setUpLabel() {
        
        label.text = "Lionel Messi"
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpSubLabel() {
        
        subLabel.text = "@Golden_ball"
        subLabel.textColor = .lightGray
        subLabel.font = .systemFont(ofSize: 17, weight: .regular)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpLabelStack() {
        
        labelStack.axis = .vertical
        labelStack.spacing = 13
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        
        labelStack.addArrangedSubview(label)
        labelStack.addArrangedSubview(subLabel)
        
        let stackConstraints = [
            
            labelStack.leftAnchor.constraint(equalTo: avatarImg.rightAnchor, constant: 30),
            labelStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            labelStack.centerYAnchor.constraint(equalTo: avatarImg.centerYAnchor)
        ]
        
        view.addSubview(labelStack)
        NSLayoutConstraint.activate(stackConstraints)
    }
    
    private func setUpSettingsView() {
        
        for index in 0...3 {
            
            let view = AccountCell()
            view.backgroundColor = UIColor(named: "LightGrayy")
            view.layer.cornerRadius = 15
            view.layer.cornerCurve = .continuous
            view.configure(title: titles[index], subTitle: subTitles[index], img: images[index])
            view.translatesAutoresizingMaskIntoConstraints = false
            
            
            let viewConstraints = [
                
                view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(240 + (index * 105))),
                view.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60),
                view.heightAnchor.constraint(equalToConstant: 85),
                view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            ]
            
            self.view.addSubview(view)
            NSLayoutConstraint.activate(viewConstraints)
        }
    }
}
