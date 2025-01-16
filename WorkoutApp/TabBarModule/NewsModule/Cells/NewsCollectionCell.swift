//
//  NewsCellController.swift
//  WorkoutApp
//
//  Created by Peter on 16.12.2023.
//

import Foundation
import UIKit

final class NewsCollectionCell: UICollectionViewCell {
    // MARK: - Identifier
    static let identifier = "NewsCollectionCell"
    
    // MARK: - Private fields
    private let nameStudio = UILabel()
    private let nameTitle = UILabel()
    private let nameAutor = UILabel()
    private let button = UIImageView()
    private let headerStack = UIStackView()
    private let stack = UIStackView()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameStudio.text = nil
        nameTitle.text = nil
        nameAutor.text = nil
    }
    
    // MARK: - Methods
    func configure(color: String, nameStudio: String, nameTitle: String, nameAutor: String) {
        if UIColor(named: color) == UIColor(named: "Greenn") {
            contentView.backgroundColor = UIColor(named: "BackColor")
            contentView.layer.borderWidth = 1
            contentView.layer.borderColor = UIColor(named: color)?.cgColor
        }
        
        self.nameStudio.text = nameStudio
        self.nameTitle.text = nameTitle
        self.nameAutor.text = nameAutor
    }
    
    // MARK: - SetUp
    private func setUp() {
        contentView.backgroundColor = UIColor(named: "LightGrayy")
        contentView.layer.cornerRadius = 15
        contentView.layer.cornerCurve = .continuous
        
        setUpNameStudio()
        setUpButton()
        setUpHeaderStack()
        setUpDescription()
        setUpNameAutor()
    }
    
    private func setUpNameStudio() {
        nameStudio.font = .systemFont(ofSize: 17, weight: .medium)
        nameStudio.textColor = .white
        nameStudio.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpButton() {
        button.image = UIImage(systemName: "chevron.forward.circle.fill")
        button.tintColor = UIColor(named: "Greenn")
        button.contentMode = .scaleAspectFill
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpHeaderStack() {
        headerStack.axis = .horizontal
        headerStack.distribution = .equalSpacing
        headerStack.translatesAutoresizingMaskIntoConstraints = false
        
        headerStack.addArrangedSubview(nameStudio)
        headerStack.addArrangedSubview(button)
        
        let headerStackConstraints = [
            headerStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            headerStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            headerStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ]
        
        contentView.addSubview(headerStack)
        NSLayoutConstraint.activate(headerStackConstraints)
    }
    
    private func setUpDescription() {
        nameTitle.font = .systemFont(ofSize: 16, weight: .medium)
        nameTitle.textColor = .white
        nameTitle.numberOfLines = 3
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let titleConstraints = [
            nameTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            nameTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ]
        
        contentView.addSubview(nameTitle)
        NSLayoutConstraint.activate(titleConstraints)
    }
    
    private func setUpNameAutor() {
        nameAutor.font = .systemFont(ofSize: 16, weight: .medium)
        nameAutor.textColor = .white
        nameAutor.translatesAutoresizingMaskIntoConstraints = false
        
        let autorConstraints = [
            nameAutor.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            nameAutor.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            nameAutor.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ]
        
        contentView.addSubview(nameAutor)
        NSLayoutConstraint.activate(autorConstraints)
    }
}
