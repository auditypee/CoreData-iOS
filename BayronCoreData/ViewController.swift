//
//  ViewController.swift
//  BayronCoreData
//
//  Created by Audi Bayron on 3/20/17.
//  Copyright © 2017 NIU Computer Science. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("abayron", forKey: "username")
        newUser.setValue("thisismypassword", forKey: "password")
        
        newUser.setValue("username1", forKey: "username")
        newUser.setValue("password1", forKey: "password")
        
        newUser.setValue("username2", forKey: "username")
        newUser.setValue("password2", forKey: "password")
        
        newUser.setValue("username3", forKey: "username")
        newUser.setValue("password3", forKey: "password")
        
        do {
            try context.save()
            print("SAVED!")
        }
        catch {
            print("ERROR!")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for item in results as! [NSManagedObject] {
                    if let username = item.value(forKey: "username") as? String {
                        print(username)
                    }
                    if let password = item.value(forKey: "password") as? String {
                        print(password)
                    }
                }
            }
            print("Found \(results.count) users.")
        }
        
        catch {
            print("Fetched Data Error!")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

