//
//  TrainCollectionCell.swift
//  WorkoutApp
//
//  Created by Peter on 09.12.2023.
//

import UIKit

final class TrainCollectionCell: UICollectionViewCell {

    // MARK: - Identifier

    static let identifier = "TrainCollectionCell"

    // MARK: - Subviews
    
    private let label = UILabel()
    private let subLabel = UILabel()
    private let labelStack = UIStackView()
    private let button = UIButton()
    private let image = UIImageView()
    private let imgView = UIView()
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle

    override func prepareForReuse() {
        super.prepareForReuse()
        
        label.text = nil
        subLabel.text = nil
        image.image = nil
    }

    // MARK: - Methods

    func configure(text: String, img: String, labelSub: String) {
        
        label.text = text
        subLabel.text = labelSub
        image.image = UIImage(named: img)
    }

    // MARK: - SetUp
    
    private func setUp() {
        
        contentView.backgroundColor = UIColor(named: "LightGrayy")
        contentView.layer.cornerRadius = 15
        contentView.layer.cornerCurve = .continuous

        setUpLabel()
        setUpSubLabel()
        setUpButton()
        setUpImage()
        setUpLabelStack()
    }
    
    private func setUpLabel() {
        
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpSubLabel() {
        
        subLabel.textColor = .white
        subLabel.font = .systemFont(ofSize: 15, weight: .light)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpLabelStack() {
        
        labelStack.axis = .vertical
        labelStack.spacing = 13
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        
        labelStack.addArrangedSubview(label)
        labelStack.addArrangedSubview(subLabel)
        
        let stackConstraints = [
        
            labelStack.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 20),
            labelStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        contentView.addSubview(labelStack)
        NSLayoutConstraint.activate(stackConstraints)
    }
    
    private func setUpImage() {
        
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.layer.cornerCurve = .continuous
        image.translatesAutoresizingMaskIntoConstraints = false
        
        let imageConstraints = [
        
            image.heightAnchor.constraint(equalToConstant: 110),
            image.widthAnchor.constraint(equalToConstant: 110),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15)
        ]
        
        contentView.addSubview(image)
        NSLayoutConstraint.activate(imageConstraints)
    }
    
    private func setUpButton() {
        
        button.backgroundColor = UIColor(named: "Greenn")
        button.setTitle("Open", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.layer.cornerRadius = 15
        button.layer.cornerCurve = .continuous
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonConstraints = [
            
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            button.widthAnchor.constraint(equalToConstant: 75),
            button.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        contentView.addSubview(button)
        NSLayoutConstraint.activate(buttonConstraints)
    }
}
