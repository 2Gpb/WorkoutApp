//
//  NutritionTableCell.swift
//  WorkoutApp
//
//  Created by Peter on 09.12.2023.
//


import UIKit

final class NutritionTableCell: UITableViewCell {
    // MARK: - Identifier
    static let identifier = "TableCell"

    // MARK: - Private variables
    private var onTapButton: (() -> Void)?

    // MARK: - Private fields
    private let images = [UIImage(named: "protein"), UIImage(named: "fats"), UIImage(named: "carbs")]
    private let mainTitle = UILabel()
    private let starButton = UIButton()
    private let kcalLabel = UILabel()
    private let fats = UILabel()
    private let carbs = UILabel()
    private let protein = UILabel()
    private let proteinImg = UIImageView()
    private let fatsImg = UIImageView()
    private let carbsImg = UIImageView()
    private let stack = UIStackView()

    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        
        mainTitle.text = nil
        kcalLabel.text = nil
        protein.text = nil
        fats.text = nil
        carbs.text = nil
    }

    // MARK: - Methods
    func configure(mainTitle: String, kcal: String, protein: String, fats: String, carbs: String) {
        self.mainTitle.text = mainTitle
        self.kcalLabel.text = kcal + " kcal"
        self.protein.text = protein
        self.fats.text = fats
        self.carbs.text = carbs
    }
    
    // MARK: - SetUp
    private func setUp() {
        contentView.backgroundColor = UIColor(named: "BackColor")
        
        setUpTitle()
        setUpStarButton()
        setUpKcalLabel()
        setUpPFC()
        setUpPFCImage()
        setUpStack()
    }
    
    private func setUpTitle() {
        mainTitle.textColor = .white
        mainTitle.font = .systemFont(ofSize: 17, weight: .medium)
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let titleConstraints = [
            mainTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            mainTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            mainTitle.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        contentView.addSubview(mainTitle)
        NSLayoutConstraint.activate(titleConstraints)
    }
    
    private func setUpStarButton() {
        starButton.setImage(UIImage(systemName: "star"), for: .normal)
        starButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
        starButton.tintColor = UIColor(named: "Greenn")
        starButton.isUserInteractionEnabled = true
        starButton.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonConstraints = [
            starButton.heightAnchor.constraint(equalToConstant: 24),
            starButton.widthAnchor.constraint(equalToConstant: 24),
            starButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            starButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ]
        
        contentView.addSubview(starButton)
        NSLayoutConstraint.activate(buttonConstraints)
    }
    
    private func setUpKcalLabel() {
        kcalLabel.textColor = .lightGray
        kcalLabel.font = .systemFont(ofSize: 17, weight: .medium)
        kcalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let kcalConstraints = [
            kcalLabel.rightAnchor.constraint(equalTo: starButton.leftAnchor, constant: -10),
            kcalLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        contentView.addSubview(kcalLabel)
        NSLayoutConstraint.activate(kcalConstraints)
    }
    
    private func setUpPFC() {
        [protein, fats, carbs].forEach {
            $0.textColor = .lightGray
            $0.font = .systemFont(ofSize: 17, weight: .medium)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpPFCImage() {
        var q = 0
        for img in [proteinImg, fatsImg, carbsImg] {
            
            img.heightAnchor.constraint(equalToConstant: 20).isActive = true
            img.widthAnchor.constraint(equalToConstant: 20).isActive = true
            img.image = images[q]
            q += 1
            img.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpStack() {
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(proteinImg)
        stack.addArrangedSubview(protein)
        stack.addArrangedSubview(fatsImg)
        stack.addArrangedSubview(fats)
        stack.addArrangedSubview(carbsImg)
        stack.addArrangedSubview(carbs)
        
        let stackConstraints = [
            stack.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 13),
            stack.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 30)
        ]
        
        contentView.addSubview(stack)
        NSLayoutConstraint.activate(stackConstraints)
    }
}
