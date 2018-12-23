//
//  Movie+CoreDataProperties.swift
//  testKtsStudio
//
//  Created by Pavel Scope on 22/12/2018.
//  Copyright © 2018 Pavel Scope. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var data: NSData?
    @NSManaged public var overview: String?
    @NSManaged public var tittle: String?

}
