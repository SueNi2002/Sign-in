//
//  entry.swift
//  Sign In Revised
//
//  Created by Sue Ni on 11/27/20.
//

import Foundation
import UIKit

class Entry {
    var name: String
    var id:String
    var on:Bool
    var bgcolor:UIColor
    var date:String
    var time:String

    init(name: String, id:String, date:String, time:String) {
        self.name = name
        self.id = id
        self.date = date
        self.time = time
        on = false
        bgcolor = .white
    }

    func out() {
        on = true
        bgcolor = .green
    }
}
