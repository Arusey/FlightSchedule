//
//  ViewController.swift
//  FlightScheduler
//
//  Created by Rochelle Lawrence on 28/01/2020.
//  Copyright © 2020 Practice. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    

    @IBAction func OriginButton(_ sender: UIButton) {
    }
    
    @IBAction func DestinationButton(_ sender: UIButton) {
    }

    @IBAction func SubmitButton(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OriginCell", for: indexPath)
        return cell
    }


    
}

