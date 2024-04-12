//
//  contactStruct.swift
//  lecture16
//
//  Created by MacBook Pro on 12.04.24.
//

import UIKit

struct ContactData {
    var fullName: String
    var age: Int
    var gender: Gender
    var hobby: String
}

enum Gender {
    case male
    case female
}
