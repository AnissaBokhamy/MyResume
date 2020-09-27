//
//  ExperienceDisplayViewController.swift
//  MyResume
//
//  Created by Anissa Bokhamy on 14/09/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import UIKit
import SwiftUI

class ExperienceDisplayViewController: UIViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var experienceStackView: UIStackView!
    
    var experiences = [Experience]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstExperience = Experience()
        firstExperience.jobTitle = "Maitrise en Informatique"
        firstExperience.quote = "« Cette expérience à l’étranger a été pour moi l’occasion de me confronter à la diversité culturelle. Académiquement, j’ai pu découvrir une nouvelle façon de »"
        firstExperience.descriptions = [String]()
        firstExperience.descriptions?.append("• Approfondissement de sujets choisis parmis une banque de cours")
        firstExperience.descriptions?.append("• Approfondissement de sujets choisis parmis une banque de cours")
        firstExperience.type = .Studies
        experiences.append(firstExperience)
        
        let secondExperience = Experience()
        secondExperience.jobTitle = "Développeur iOS"
        secondExperience.quote = "« Cette expérience en start-up a été pour moi l’occasion de me confronter à la diversité culturelle. Académiquement, j’ai pu découvrir une nouvelle façon de »"
        secondExperience.descriptions = [String]()
        secondExperience.descriptions?.append("• Approfondissement de sujets choisis parmis une banque de cours")
        secondExperience.descriptions?.append("• Approfondissement de sujets choisis parmis une banque de cours")
        secondExperience.type = .DevelopperJob
        experiences.append(secondExperience)
        
        experiences.forEach { experience in
            let experienceView = ExperienceView(experience: experience)
            let experienceViewHostingController = UIHostingController(rootView: experienceView)
            
            experienceViewHostingController.view.translatesAutoresizingMaskIntoConstraints = false
            experienceViewHostingController.view.frame = self.view.frame
            
            self.experienceStackView.addArrangedSubview(UIHostingController(rootView: experienceView).view)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
