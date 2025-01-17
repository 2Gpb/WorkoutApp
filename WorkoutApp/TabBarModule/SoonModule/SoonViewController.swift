//
//  SoonViewController.swift
//  WorkoutApp
//
//  Created by Peter on 10.12.2023.
//

import Foundation
import UIKit

final class SoonViewController: UIViewController {
    // MARK: - Private fields
    private let mainTitle = UILabel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = UIColor(named: "BackColor")
        
        setUpBackArrow()
        setUpLabel()
    }
    
    private func setUpBackArrow() {
        let backButtonImage = UIImage(systemName: "arrow.left")
        let customBackButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem = customBackButton
        navigationItem.leftBarButtonItem?.tintColor = .white
    }

    private func setUpLabel() {
        mainTitle.text = "Soon.."
        mainTitle.textColor = .white
        mainTitle.textAlignment = .center
        mainTitle.font = .systemFont(ofSize: 32, weight: .bold)
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let titleConstraints = [
            mainTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300)
        ]
        
        view.addSubview(mainTitle)
        NSLayoutConstraint.activate(titleConstraints)
    }
    
    // MARK: - Actions
    @objc
    private func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
