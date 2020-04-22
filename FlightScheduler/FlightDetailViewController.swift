//
//  FlightDetailViewController.swift
//  FlightScheduler
//
//  Created by Kevin Lagat on 22/04/2020.
//  Copyright © 2020 Practice. All rights reserved.
//

import UIKit
import CoreData

class FlightDetailViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createFlight(_ sender: Any) {
        createData()
    }
    
    
    @IBAction func getFlight(_ sender: Any) {
        retrieveData()
    }
    
    @IBAction func updateFlight(_ sender: Any) {
        updateData()
    }
    @IBAction func deleteFlight(_ sender: Any) {
        deleteData()
    }
    

    
    
    
    func createData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
                
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let flightEntity  = NSEntityDescription.entity(forEntityName: "Flights", in: managedContext)!
        
            let flight = NSManagedObject(entity: flightEntity, insertInto: managedContext)
            flight.setValue("Rochelle", forKey: "flightName")
            flight.setValue("Nairobi", forKey: "origin")
            flight.setValue("Mombasa", forKey: "destination")
            flight.setValue("120 minutes", forKey: "duration")
            
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func retrieveData() {
    
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Flights")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "flightName") as! String)
            }
        } catch {
            print("Failed")
        }
    }
    
    func updateData(){
     
         //As we know that container is set up in the AppDelegates so we need to refer that container.
         guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
         
         //We need to create a context from this container
         let managedContext = appDelegate.persistentContainer.viewContext
         
         let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Flights")
         fetchRequest.predicate = NSPredicate(format: "flightName = %@", "Rochelle")
         do
         {
             let test = try managedContext.fetch(fetchRequest)
    
                 let objectUpdate = test[0] as! NSManagedObject
                 objectUpdate.setValue("newflight", forKey: "flightName")
                 objectUpdate.setValue("neworigin", forKey: "origin")
                 objectUpdate.setValue("newdestination", forKey: "destination")
                 objectUpdate.setValue("newduration", forKey: "duration")

                 do{
                     try managedContext.save()
                 }
                 catch
                 {
                     print(error)
                 }
             }
         catch
         {
             print(error)
         }
    
     }
    
    func deleteData(){
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Flights")
        fetchRequest.predicate = NSPredicate(format: "flightName = %@", "Rochelle")
       
        do
        {
            let test = try managedContext.fetch(fetchRequest)
            
            let objectToDelete = test[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            
            do{
                try managedContext.save()
            }
            catch
            {
                print(error)
            }
            
        }
        catch
        {
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}

