//
//  MainCollectionCell.swift
//  WorkoutApp
//
//  Created by Peter on 09.12.2023.
//

import Foundation
import UIKit

class MainCollectionCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "MainCollectionCell"

    // MARK: - Subviews
    
    private let mainTitle = UILabel()
    private let button = UIImageView()
    private let headerStack = UIStackView()
    private let image = UIImageView()
    private let subTitle = UILabel()
    private let stack = UIStackView()
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        mainTitle.text = nil
        image.image = nil
        subTitle.text = nil
    }

    // MARK: - Methods

    func configure(color: String, title: String, img: String, label: String) {

        if UIColor(named: color) == UIColor(named: "Greenn") {
            contentView.backgroundColor = UIColor(named: "BackColor")
            contentView.layer.borderWidth = 1
            contentView.layer.borderColor = UIColor(named: color)?.cgColor
        }
        
        mainTitle.text = title
        image.image = UIImage(systemName: img)
        subTitle.text = label
    }
    
    // MARK: - SetUp
    
    private func setUp() {
        
        contentView.backgroundColor = UIColor(named: "LightGrayy")
        contentView.layer.cornerRadius = 15
        contentView.layer.cornerCurve = .continuous
        
        setUpMainTitle()
        setUpButton()
        setUpHeaderStack()
        
        setUpImage()
        setUpSubTitle()
        setUpStack()
    }
    
    private func setUpMainTitle() {
        
        mainTitle.font = .systemFont(ofSize: 17, weight: .medium)
        mainTitle.textColor = .white
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpButton() {
        
        button.image = UIImage(systemName: "chevron.forward.circle.fill")
        button.tintColor = UIColor(named: "Greenn")
        button.contentMode = .scaleAspectFill
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpImage() {
        
        image.heightAnchor.constraint(equalToConstant: 60).isActive = true
        image.tintColor = UIColor(named: "Greenn")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpSubTitle() {
        
        subTitle.font = .systemFont(ofSize: 16, weight: .medium)
        subTitle.textColor = .white
        subTitle.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpHeaderStack() {
        
        headerStack.axis = .horizontal
        headerStack.distribution = .equalSpacing
        headerStack.translatesAutoresizingMaskIntoConstraints = false
        
        headerStack.addArrangedSubview(mainTitle)
        headerStack.addArrangedSubview(button)
        
        let headerStackConstraints = [
        
            headerStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            headerStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            headerStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ]
        
        contentView.addSubview(headerStack)
        NSLayoutConstraint.activate(headerStackConstraints)
    }
    
    private func setUpStack() {
        
        stack.axis = .vertical
        stack.spacing = 25
        stack.translatesAutoresizingMaskIntoConstraints = false
        

        stack.addArrangedSubview(image)
        stack.addArrangedSubview(subTitle)
        
        let stackConstraints = [
        
            stack.topAnchor.constraint(equalTo: headerStack.topAnchor, constant: 40),
            stack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            stack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25)
        ]
        
        contentView.addSubview(stack)
        NSLayoutConstraint.activate(stackConstraints)
    }

}
