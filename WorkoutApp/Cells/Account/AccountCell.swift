//
//  AccountCell.swift
//  WorkoutApp
//
//  Created by Peter on 13.12.2023.
//

import Foundation
import UIKit

class AccountCell: UIView {
    
    //MARK: - SubViews
    
    private let image = UIImageView()
    private let mainTitle = UILabel()
    private let subTitle = UILabel()
    private let stack = UIStackView()
    private let arrowImg = UIImageView()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    func configure(title: String, subTitle: String, img: String) {
        
        image.image = UIImage(systemName: img)
        mainTitle.text = title
        self.subTitle.text = subTitle
        
        if img == "arrow.right.square.fill" {
            
            image.tintColor = .systemRed
        }
    }
    
    //MARK: - SetUp
    
    private func setUp() {
        
        setUpImage()
        setUpMainTitle()
        setUpSubTitle()
        setUpArrowImg()
        viewTappedSetUp()
    }
    
    private func setUpImage() {
        
        image.tintColor = UIColor(named: "Greenn")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints  = false
        
        let imageConstraints = [
        
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            image.heightAnchor.constraint(equalToConstant: 40),
            image.widthAnchor.constraint(equalToConstant: 40)
        ]
        
        addSubview(image)
        NSLayoutConstraint.activate(imageConstraints)
    }
    
    private func setUpMainTitle() {
        
        mainTitle.font = .systemFont(ofSize: 17, weight: .medium)
        mainTitle.textColor = .white
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let titleConstraints = [
        
            mainTitle.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 20),
            mainTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ]
        
        addSubview(mainTitle)
        NSLayoutConstraint.activate(titleConstraints)
    }
    
    private func setUpSubTitle() {
        
        subTitle.font = .systemFont(ofSize: 15, weight: .light)
        subTitle.textColor = .white
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let subConstraints = [
        
            subTitle.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 20),
//            subTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -45),
            subTitle.topAnchor.constraint(equalTo: topAnchor, constant: 48)
        ]
        
        addSubview(subTitle)
        NSLayoutConstraint.activate(subConstraints)
    }
    
    private func setUpLabelStack() {
        
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(mainTitle)
        stack.addArrangedSubview(subTitle)
        
        let stackConstraints = [
        
            stack.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 20),
            stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -45),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        addSubview(stack)
        NSLayoutConstraint.activate(stackConstraints)
    }
    
    private func setUpArrowImg() {
        
        arrowImg.image = UIImage(systemName: "chevron.right")
        arrowImg.tintColor = UIColor(named: "Greenn")
        arrowImg.contentMode = .scaleAspectFill
        arrowImg.translatesAutoresizingMaskIntoConstraints = false
        
        let arrowConstraints = [
        
            arrowImg.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            arrowImg.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImg.widthAnchor.constraint(equalToConstant: 17)
        ]
        
        addSubview(arrowImg)
        NSLayoutConstraint.activate(arrowConstraints)
    }
    
    private func viewTappedSetUp() {
            
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        addGestureRecognizer(tapGesture)
    }

    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
    
        print("CustomView tapped!")
    }
}
