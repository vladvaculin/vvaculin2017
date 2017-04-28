//
//  ArticleManager.swift
//  Pods
//
//  Created by Vaculin Vladislav on 4/27/17.
//
//

import Foundation
import CoreData


@available(iOS 10.0, *)
public class ArticleManager : NSObject {
    
    public var managedObjectContext: NSManagedObjectContext
    
    public override init() {
        
        
        guard let modelURL = Bundle(for: Article.self).url(forResource: "article", withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        
//        //This resource is the same name as your xcdatamodeld contained in your project
//        guard let modelURL = Bundle.main.url(forResource: "article", withExtension:"momd") else {
//            fatalError("Error loading model from bundle")
//        }
//        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
//        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
//            fatalError("Error initializing mom from: \(modelURL)")
//        }
//        
//        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
//        
//        managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
//        managedObjectContext.persistentStoreCoordinator = psc
        
//        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
//        queue.async {
            guard let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
                fatalError("Unable to resolve document directory")
            }
            let storeURL = docURL.appendingPathComponent("vvaculin2017.sqlite")
            do {
                try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
                //The callback block is expected to complete the User Interface and therefore should be presented back on the main queue so that the user interface does not need to be concerned with which queue this call is coming from.
//                DispatchQueue.main.sync(execute: completionClosure)
            } catch {
                fatalError("Error migrating store: \(error)")
//            }
        }
        
        
        
        
//        let modelURL = Bundle.main.url(forResource: "article", withExtension:"momd")
//        managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
    }

    
    
    public func newArticle() -> Article {
        let a = NSEntityDescription.insertNewObject(forEntityName: "Article", into: managedObjectContext) as! Article
        
        return a
    }
    
    public func newArticle(title : String, content : String, lang : String, image : NSData) -> Article {
        let art = NSEntityDescription.insertNewObject(forEntityName: "Article", into: managedObjectContext) as! Article
        
//        art.setValue(title, forKey: "title")
//        art.setValue(content, forKey: "content")
//        art.setValue(lang, forKey: "lang")
//        art.setValue(NSDate(), forKey: "createDate")
//        art.setValue(NSDate(), forKey: "updateDate")
        art.title = title
        art.content = content
        art.lang = lang
        art.createdDate = NSDate()
        art.updateDate = NSDate()
        art.image = image
        return art
    }
    
    public func getAllArticles() -> [Article] {
        print("go")
        let request = NSFetchRequest<Article>(entityName: "Article")

//        let q : NSFetchRequest<Article> = Article.fetchRequest()
        print("go")
//        q.returnsObjectsAsFaults = false
print("go")
        do {
            print("este")
//            let res = try q.execute()
            let result = try managedObjectContext.fetch(request as! NSFetchRequest<NSFetchRequestResult>) as! [Article]
            print(result.count)
            print("vsio")
            return result
        }
        catch {
            print("pzdt")
            return []
        }
    }
    
    
    public func getArticles(withLang lang : String) -> [Article] {
        let arts = getAllArticles()
        var ret : [Article] = []
        for a in arts {
            if a.lang == lang {
                ret.append(a)
            }
        }
        if ret.count > 0 {
            print("yeeee")
            print(ret.count)
            return ret
        }
        return []
    }
    
    public func getArticles(containString str: String) -> [Article] {
        let arts = getAllArticles()
        var ret : [Article] = []
        for a in arts {
            if a.content != nil {
                if (a.content?.contains(str))! {
                    ret.append(a)
                }
            }
        }
        if ret.count > 0 {
            return ret
        }
        return []
    }
    
    public func removeArticle(article: Article) {
        print("hm")
        managedObjectContext.delete(article)

    }
    
    public func removeAllArticles() {
        let arts = getAllArticles()
        print("int rem",arts.count)
        var i = 0
        for a in arts{
            print("in a rem" + String(i))
            i += 1
            removeArticle(article: a)
        }
    }
    
    public func save() {
//        print("intra")
        if managedObjectContext.hasChanges {
            do {
//                print("iar intra , merji ")
                try managedObjectContext.save()
            }
            catch {
//                print("iese")
                fatalError("WT?F?F?F?F?F?F?F")
            }
        } else{
            print("nu are schimbari")
        }
    }
    
}
