//
//  Article+CoreDataProperties.swift
//  Pods
//
//  Created by Vaculin Vladislav on 4/28/17.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article");
    }

    @NSManaged public var title: String?
    @NSManaged public var lang: String?
    @NSManaged public var content: String?
    @NSManaged public var image: NSData?
    @NSManaged public var updateDate: NSDate?
    @NSManaged public var createdDate: NSDate?

    override public var description : String {
        return "Articolul : \(title) in limba : \(lang)\n\(content)\nCreat : \(createdDate)\nModificat : \(updateDate)"
    }
}
