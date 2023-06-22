//
//  Car+CoreDataProperties.swift
//  CarsList
//
//  Created by Никита Коголенок on 22.06.23.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var brand: String?
    @NSManaged public var descriptionCar: String?
    @NSManaged public var images: String?
    @NSManaged public var model: String?

}

extension Car : Identifiable {

}
