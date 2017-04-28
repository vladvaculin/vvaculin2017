//
//  ViewController.swift
//  vvaculin2017
//
//  Created by Vlad Vaculin on 04/27/2017.
//  Copyright (c) 2017 Vlad Vaculin. All rights reserved.
//

import UIKit
import vvaculin2017

@available(iOS 10.0, *)
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = ArticleManager()
//        print(manager.getAllArticles())
        
//        let art = manager.newArticle()
//        art.title = "Titl 69"
//        art.content = "alfa\n\n\ninca Con"
//        art.lang = "ro"
//        art.updateDate = NSDate()
//        art.createdDate = NSDate()
//        manager.save()
//        
//        let art2 = manager.newArticle()
//        art2.title = "Titl 696"
//        art2.content = "alfa\n\n\ninca Con"
//        art2.lang = "ro"
//        art2.updateDate = NSDate()
//        art2.createdDate = NSDate()
//        manager.save()
        
        
//        print("sp")
////        print(manager.getAllArticles()[0])
//        print("r")
////        print(manager.getAllArticles())
        let ar = manager.getAllArticles()
        ar.forEach({ a in
            print(a)
            })
        manager.removeAllArticles()
//        manager.removeArticle(article: ar[3])
        manager.save()
        
        
//        print(manager.getArticles(containString: "contennnnt"))
//        
//        
//        manager.removeAllArticles()
//        
//        manager.save()
//        
//        print(manager.getAllArticles())
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

