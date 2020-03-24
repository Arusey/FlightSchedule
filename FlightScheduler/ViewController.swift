//
//  ViewController.swift
//  FlightScheduler
//
//  Created by Rochelle Lawrence on 28/01/2020.
//  Copyright © 2020 Practice. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func OriginButton(_ sender: UIButton) {
    }
    
    @IBAction func DestinationButton(_ sender: UIButton) {
    }

    @IBAction func SubmitButton(_ sender: UIButton) {
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        submitButton.addTarget(self, action: #selector(self.onTap(_:)), for: .touchUpInside)
    }



   @objc func onTap(_ sender: AnyObject) -> Void {

       let url = URL(string: "https://api.lufthansa.com/v1/oauth/token")!
       let request = URLRequest(url: url)
       let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
           //the service response is here
            print (data)
            print (response)
            print (error)
    
    })
    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OriginCell", for: indexPath)
        return cell
    }


    
}


