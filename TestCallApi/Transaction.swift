//
//  Transaction.swift
//  TestCallApi
//
//  Created by Andrew Allshouse on 7/3/17.
//  Copyright © 2017 Andrew Allshouse. All rights reserved.
//

import Foundation

public class Transaction {
    public let Id: Int
    public let Description: String
    public let Amount: Float
    public let Category: String
    public let Date: Date
    
    init(json:[String:Any]) {
        self.Id = (json["id"] as? Int)!
        self.Description = (json["description"] as? String)!
        self.Amount = Float((json["amount"] as? String)!)!
        self.Category = (json["category"] as? String)!
        
        let tempDate = (json["transactiondate"] as? String)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        self.Date = dateFormatter.date(from: tempDate)!
    }
}
