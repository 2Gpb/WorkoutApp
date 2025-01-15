//
//  NutritionViewController.swift
//  WorkoutApp
//
//  Created by Peter on 09.12.2023.
//

import UIKit

final class NutritionViewController: UIViewController {
    
    //MARK: - Proprties
    
    var data = ["Caesar salad", "Caesar salad", "Caesar salad", "Caesar salad", "Caesar salad" ]
    var kcals = ["12", "12", "12", "12", "12"]
    var proteins = ["12", "12", "12", "12", "12"]
    var fats = ["12", "12", "12", "12", "12"]
    var carbs = ["12", "12", "12", "12", "12"]
    
    //MARK: - SubViews
    
    private let mainTitle = UILabel()
    private let tableView = UITableView()
    private lazy var button = UIButton()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
        tableView.reloadData()
    }
    
    //MARK: - SetUp
    
    private func setUp() {
        
        view.backgroundColor = UIColor(named: "BackColor")
        
        setUpTitle()
        setUpTable()
        setUpButton()
    }
    
    private func setUpTitle() {
        
        mainTitle.text = "Menu choices"
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
    
    private func setUpTable() {
        
        tableView.register(NutritionTableCell.self, forCellReuseIdentifier: NutritionTableCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "BackColor")
        tableView.isScrollEnabled = true
        tableView.dataSource = self
        tableView.delegate = self
        
        let tableConstraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ]
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate(tableConstraints)
    }
    
    private func setUpButton() {
        
        button.backgroundColor = UIColor(named: "Greenn")
        button.setTitle("Add a dish", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.layer.cornerRadius = 15
        button.layer.cornerCurve = .continuous
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction {[weak self] _ in
            guard let self else { return }
            
                let vc = AddViewController()
                vc.delegate = self
                self.navigationController?.pushViewController(vc, animated: true)
            
        }, for: .touchUpInside)
        
        let buttonConstraints = [
            button.heightAnchor.constraint(equalToConstant: 56),
            button.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30),
            button.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ]
        
        view.addSubview(button)
        NSLayoutConstraint.activate(buttonConstraints)
    }
}

//MARK: - UITableViewDataSource

extension NutritionViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NutritionTableCell.identifier) as? NutritionTableCell else {
            return UITableViewCell()
        }
        
        cell.configure(mainTitle: data[indexPath.row], kcal: kcals[indexPath.row], protein: proteins[indexPath.row], fats: fats[indexPath.row], carbs: carbs[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        72
    }
    
  
}

// MARK: - UITableViewDelegate

extension NutritionViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(SoonViewController(), animated: true)
    }
}

// MARK: - AddViewControllerDelegate

extension NutritionViewController: AddViewControllerDelegate {

    func update(name: String, kcal: String, protein: String, fats: String, carbs: String) {
        self.data.append(name)
        self.kcals.append(kcal)
        self.proteins.append(protein)
        self.fats.append(fats)
        self.carbs.append(carbs)
        
        tableView.reloadData()
    }
    
}
