//
//  FlightListTableViewController.swift
//  FlightScheduler
//
//  Created by Kevin Lagat on 22/04/2020.
//  Copyright © 2020 Practice. All rights reserved.
//

import UIKit
import CoreData


class FlightListTableViewController: UITableViewController {
    
    let appDelegateObj: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var dataArray = [NSManagedObject]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Flights"

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

 

}
