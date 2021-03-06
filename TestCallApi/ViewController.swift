//
//  ViewController.swift
//  TestCallApi
//
//  Created by Andrew Allshouse on 7/3/17.
//  Copyright © 2017 Andrew Allshouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://localhost:3000/transactions/find/123")!
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    let trans = Transaction(json: json)
                    print("Id: \(trans.Id)")
                    print("Description: \(trans.Description)")
                    print("Amount: \(trans.Amount)")
                    print("Category: \(trans.Category)")
                    print("Date: \(trans.Date)")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

