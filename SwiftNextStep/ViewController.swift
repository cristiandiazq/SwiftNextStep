//
//  ViewController.swift
//  SwiftNextStep
//
//  Created by Cristian Diaz on 12/26/15.
//  Copyright © 2015 MyApps. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let query = PFQuery(className: "myFirstTable")
    query.findObjectsInBackgroundWithBlock { (results:[PFObject]?, error: NSError?) -> Void in
      if let error = error {print("error querying MyFirstTable - \(error.localizedDescription)")}
      else {
        if let results = results as [PFObject]?{
          for result in results {
            print(result)
          }
        }
      }
    }
    
  }
  
    
    func saveTestObject(foo: String) {
      
      let testObject = PFObject(className: "TestObject")
      testObject["foo"] = "foo"
      testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
        print("Object has been saved.")
        
      }
    }
    
    
    func saveMyFirstTable (firstName: String, lastName: String, age: Int, loveLearning: Bool) {
      
      let myFirstTable = PFObject(className: "myFirstTable")
      myFirstTable["myFirstName"] = firstName
      myFirstTable["myLastName"] = lastName
      myFirstTable["Age"] = age
      myFirstTable["iLoveLearning"] = loveLearning
      myFirstTable.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
        print("Parece que todo salio bien")
        
    }
  }
    
    
}

 




