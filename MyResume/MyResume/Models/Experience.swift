//
//  Experience.swift
//  MyResume
//
//  Created by Anissa Bokhamy on 13/09/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import Foundation

class Experience {
    
    var company: String?
    var endDate: Date?
    var jobTitle: String?
    var location: NSObject?
    var quote: String?
    var skills: NSObject?
    var startDate: Date?
    var type: ExperienceType?
    var descriptions: [String]?
    
}

enum ExperienceType: String {
    case StudentJob = "Student Job"
    case Studies = "Studies"
    case DevelopperJob = "Developper Job"
    case StudentProject = "Student project"
    case PersonalProject = "Personal project"
}
