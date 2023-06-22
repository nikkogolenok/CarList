//
//  DescriptionCarViewController.swift
//  CarsList
//
//  Created by Никита Коголенок on 16.06.23.
//

import UIKit
import SnapKit

class DescriptionCarViewController: UIViewController {
    
    // MARK: - GUI Variables
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .white
        
        return view
    }()
    
    private let carImageViewLeading: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let carImageViewTrailing: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.addSubview(carImageViewLeading)
        containerView.addSubview(carImageViewTrailing)
        containerView.addSubview(descriptionLabel)
        self.view.addSubview(containerView)
        setConstraint()
    }
    
    func setConstraint() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        carImageViewLeading.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.top.equalTo(100)
            make.leading.equalTo(containerView).offset(5)
        }
        
        carImageViewTrailing.snp.makeConstraints { make in
            make.width.height.equalTo(carImageViewLeading)
            make.left.equalTo(carImageViewLeading.snp.right)
            make.top.equalTo(100)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(carImageViewLeading.snp.bottom).offset(20)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
    }
    
    func updateDescription(car: CarDatum) {
        let urlCarLeading = car.images[0]
        let urlCarTrailing = car.images[1]
        self.carImageViewLeading.downloaded(from: urlCarLeading)
        self.carImageViewTrailing.downloaded(from: urlCarTrailing)
        self.descriptionLabel.text = car.description
    }
}
