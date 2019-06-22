//
//  UIViewController+Context.swift
//  TopMovies
//
//  Created by Gabriel Pereira on 22/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        return appDelegate.persistentContainer.viewContext
    }
}
