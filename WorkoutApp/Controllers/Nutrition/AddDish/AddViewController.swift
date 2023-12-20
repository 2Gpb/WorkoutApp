//
//  AddViewController.swift
//  WorkoutApp
//
//  Created by Peter on 09.12.2023.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func update(name: String, kcal: String, protein: String, fats: String, carbs: String)
}

class AddViewController: UIViewController{
    
    //MARK: - Properties
    
    var delegate: AddViewControllerDelegate?
    
    //MARK: - SubViews
    
    private let mainTitle = UILabel()
    private let nameTextField = UITextField()
    private let kcalTextField = UITextField()
    private let proteinTextField = UITextField()
    private let fatsTextField = UITextField()
    private let carbsTextField = UITextField()
    private let doneButton = UIButton()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    //MARK: - SetUp
    
    private func setUp() {
        
        view.backgroundColor = UIColor(named: "BackColor")

        setUpNavigation()
        setUpTitle()
        setUpDoneButton()
        setUpNameTextField()
        setUpProteinTextField()
        setUpFatsTextField()
        setUpCarbsTextField()
        setUpKcalTextField()
    }
    
    private func setUpNavigation() {
        
        self.navigationController?.isNavigationBarHidden = false
        let backButtonImage = UIImage(systemName: "arrow.left")
        let customBackButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem = customBackButton
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setUpTitle() {
        
        mainTitle.text = "Enter your own dish"
        mainTitle.textColor = .white
        mainTitle.font = .boldSystemFont(ofSize: 32)
        mainTitle.textAlignment = .center
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let mainTitleConstraints = [
            
            mainTitle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        ]
        
        view.addSubview(mainTitle)
        NSLayoutConstraint.activate(mainTitleConstraints)
    }
    
    private func setUpNameTextField() {
        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        nameTextField.textColor = .white
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor(named: "Greenn")!.cgColor
        nameTextField.layer.cornerRadius = 15
        nameTextField.layer.cornerCurve = .continuous
        nameTextField.leftView = UIView(frame: CGRectMake(0, 0, 20, nameTextField.frame.height))
        nameTextField.leftViewMode = UITextField.ViewMode.always
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let nameTextFieldConstraints = [
            nameTextField.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 20),
            nameTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30.0),
            nameTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30.0),
            nameTextField.heightAnchor.constraint(equalToConstant: 56.0)
        ]
        
        view.addSubview(nameTextField)
        NSLayoutConstraint.activate(nameTextFieldConstraints)
    }
    
    private func setUpProteinTextField() {
        proteinTextField.attributedPlaceholder = NSAttributedString(
            string: "Protein (per 100gr..)",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        proteinTextField.textColor = .white
        proteinTextField.layer.borderWidth = 1
        proteinTextField.layer.borderColor = UIColor(named: "Greenn")!.cgColor
        proteinTextField.layer.cornerRadius = 15
        proteinTextField.layer.cornerCurve = .continuous
        proteinTextField.leftView = UIView(frame: CGRectMake(0, 0, 20, proteinTextField.frame.height))
        proteinTextField.leftViewMode = UITextField.ViewMode.always
        proteinTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let proteinTextFieldConstraints = [
            proteinTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            proteinTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30.0),
            proteinTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30.0),
            proteinTextField.heightAnchor.constraint(equalToConstant: 56.0)
        ]
        
        view.addSubview(proteinTextField)
        NSLayoutConstraint.activate(proteinTextFieldConstraints)
    }
    
    private func setUpFatsTextField() {
        fatsTextField.attributedPlaceholder = NSAttributedString(
            string: "Fats (per 100gr..)",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        fatsTextField.textColor = .white
        fatsTextField.layer.borderWidth = 1
        fatsTextField.layer.borderColor = UIColor(named: "Greenn")!.cgColor
        fatsTextField.layer.cornerRadius = 15
        fatsTextField.layer.cornerCurve = .continuous
        fatsTextField.leftView = UIView(frame: CGRectMake(0, 0, 20, fatsTextField.frame.height))
        fatsTextField.leftViewMode = UITextField.ViewMode.always
        fatsTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let fatsTextFieldConstraints = [
            fatsTextField.topAnchor.constraint(equalTo: proteinTextField.bottomAnchor, constant: 15),
            fatsTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30.0),
            fatsTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30.0),
            fatsTextField.heightAnchor.constraint(equalToConstant: 56.0)
        ]
        
        view.addSubview(fatsTextField)
        NSLayoutConstraint.activate(fatsTextFieldConstraints)
    }
    
    private func setUpCarbsTextField() {
        carbsTextField.attributedPlaceholder = NSAttributedString(
            string: "Carbs (per 100gr..)",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        carbsTextField.textColor = .white
        carbsTextField.layer.borderWidth = 1
        carbsTextField.layer.borderColor = UIColor(named: "Greenn")!.cgColor
        carbsTextField.layer.cornerRadius = 15
        carbsTextField.layer.cornerCurve = .continuous
        carbsTextField.leftView = UIView(frame: CGRectMake(0, 0, 20, carbsTextField.frame.height))
        carbsTextField.leftViewMode = UITextField.ViewMode.always
        carbsTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let carbsTextFieldConstraints = [
            carbsTextField.topAnchor.constraint(equalTo: fatsTextField.bottomAnchor, constant: 15),
            carbsTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30.0),
            carbsTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30.0),
            carbsTextField.heightAnchor.constraint(equalToConstant: 56.0)
        ]
        
        view.addSubview(carbsTextField)
        NSLayoutConstraint.activate(carbsTextFieldConstraints)
    }
    
    private func setUpKcalTextField() {
        kcalTextField.attributedPlaceholder = NSAttributedString(
            string: "Kcal (per 100gr..)",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        kcalTextField.textColor = .white
        kcalTextField.layer.borderWidth = 1
        kcalTextField.layer.borderColor = UIColor(named: "Greenn")!.cgColor
        kcalTextField.layer.cornerRadius = 15
        kcalTextField.layer.cornerCurve = .continuous
        kcalTextField.leftView = UIView(frame: CGRectMake(0, 0, 20, kcalTextField.frame.height))
        kcalTextField.leftViewMode = UITextField.ViewMode.always
        kcalTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let kcalTextFieldConstraints = [
            kcalTextField.topAnchor.constraint(equalTo: carbsTextField.bottomAnchor, constant: 15),
            kcalTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30.0),
            kcalTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30.0),
            kcalTextField.heightAnchor.constraint(equalToConstant: 56.0)
        ]
        
        view.addSubview(kcalTextField)
        NSLayoutConstraint.activate(kcalTextFieldConstraints)
    }
    
    private func setUpDoneButton() {
        
        doneButton.setTitle("Done", for: .normal)
        doneButton.backgroundColor = UIColor(named: "Greenn")
        doneButton.setTitleColor(.black, for: .normal)
        doneButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        doneButton.layer.cornerRadius = 15.0
        doneButton.layer.cornerCurve = .continuous
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.addAction(UIAction {[weak self] _ in
            guard let self else { return }
            
            if let name = nameTextField.text,
                let kcal = kcalTextField.text, let protein = proteinTextField.text, let fats = fatsTextField.text, let carbs = carbsTextField.text {
                
                self.delegate?.update(name: name, kcal: kcal, protein: protein, fats: fats, carbs: carbs)
                self.navigationController?.popViewController(animated: true)
            }
        }, for: .touchUpInside)
        
        let doneButtonConstraints = [
            doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            doneButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            doneButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            doneButton.heightAnchor.constraint(equalToConstant: 56)
        ]
        
        view.addSubview(doneButton)
        NSLayoutConstraint.activate(doneButtonConstraints)
    }

}
