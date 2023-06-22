//
//  CarViewController+Ext.swift
//  CarsList
//
//  Created by Никита Коголенок on 16.06.23.
//

import UIKit

extension CarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as? CarTableViewCell else { return UITableViewCell() }
        let car = cars[indexPath.row]
        cell.updateUIInCell(car: car)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let descriptionCarViewController = DescriptionCarViewController()
        let car = cars[indexPath.row]
        descriptionCarViewController.updateDescription(car: car)
        navigationController?.pushViewController(descriptionCarViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
