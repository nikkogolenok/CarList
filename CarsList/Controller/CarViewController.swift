//
//  ViewController.swift
//  CarsList
//
//  Created by Никита Коголенок on 15.06.23.
//

import UIKit
import SnapKit

class CarViewController: UIViewController {
    
    // MARK: - Variables
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var cars = [CarDatum]()
    
    // MARK: - Private properties
    private var tableView = UITableView()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
        APIManager.shared.downloadJson { [weak self] downloadedCars in
            self?.cars = downloadedCars
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Methods
    func createTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Cars list"
        tableView.register(CarTableViewCell.self, forCellReuseIdentifier: CarTableViewCell.identifier)
    }
}
