//
//  CarTableViewCell.swift
//  CarsList
//
//  Created by Никита Коголенок on 16.06.23.
//

import UIKit
import CoreData
import SnapKit

class CarTableViewCell: UITableViewCell {
    
    // MARK: - Variables
    var car: [NSManagedObject] = []

    // MARK: - GUI Variable
    static let identifier = "CarTableViewCell"
    
    // MARK: - GUI Variables
    private let carImageViewLeft: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true 
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let brandCarLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let modelCarLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        return view
    }()
    
    private let carImageViewRight: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(carImageViewLeft)
        containerView.addSubview(brandCarLabel)
        containerView.addSubview(modelCarLabel)
        self.contentView.addSubview(containerView)
        contentView.addSubview(carImageViewRight)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }
    
    // MARK: - Methods
    func setConstraints() {
        carImageViewLeft.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(10)
            make.top.equalTo(contentView).offset(10)
            make.width.height.equalTo(50)
        }
        
        containerView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(carImageViewLeft.snp.trailing).offset(10)
            make.trailing.equalTo(contentView).offset(-10)
            make.height.equalTo(40)
        }
        
        brandCarLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(containerView)
        }
        
        modelCarLabel.snp.makeConstraints { make in
            make.top.equalTo(brandCarLabel.snp.bottom)
            make.leading.equalTo(containerView.snp.leading)

        }
        
        carImageViewRight.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
            make.width.height.equalTo(carImageViewLeft)
        }
    }
    
    func updateUIInCell(car: CarDatum) {
        let urlCarLeft = car.images[0]
        let urlCarRigth = car.images[1]
        self.carImageViewLeft.downloaded(from: urlCarLeft)
        self.carImageViewRight.downloaded(from: urlCarRigth)
        self.brandCarLabel.text = car.brand
        self.modelCarLabel.text = car.model
    }
    
    func saveContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
     func save(carData: CarDatum) {
        let context = saveContext()
        guard let entity = NSEntityDescription.entity(forEntityName: "Car", in: context) else { return }
        
        let auto = NSManagedObject(entity: entity, insertInto: context)
        auto.setValue(carData.brand, forKey: "brand")
        auto.setValue(carData.model, forKey: "model")
        auto.setValue(carData.description, forKey: "descriptionCar")
        auto.setValue(carData.images, forKey: "images")
        
        do {
            try context.save()
            car.append(auto)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
