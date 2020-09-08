//
//  ProfileViewController.swift
//  MyResume
//
//  Created by Anissa Bokhamy on 03/09/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var conversationTableView: UITableView!
    @IBOutlet weak var responseOptionsStackView: UIStackView!
    
    
    var person : Person?
    
    var questionsAndAnswersList = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.conversationTableView.delegate = self
        self.conversationTableView.dataSource = self
        self.conversationTableView.register(LeftMessageViewCell.self, forCellReuseIdentifier: "LeftMessage")
        self.conversationTableView.register(RightMessageViewCell.self, forCellReuseIdentifier: "RightMessage")
        
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            fatalError("Unable to read managed object context.")
        }
        self.person = Person(context: context)
        self.person?.firstName = "Anissa"
        self.person?.lastName = "Bokhamy"
        self.person?.photoName = "PhotoAnissa"
        
        self.firstNameLabel.text = self.person?.firstName
        self.lastNameLabel.text = self.person?.lastName?.capitalized
        let photoName = self.person?.photoName ?? ""
        if photoName != "" {
            self.profilePicture.image = UIImage(named: photoName)
        }
        self.questionsAndAnswersList.append(self.person?.catchPhrase ?? "...")
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

extension ProfileViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionsAndAnswersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = self.conversationTableView.dequeueReusableCell(withIdentifier: "LeftMessage", for: indexPath) as! LeftMessageViewCell
            let photoName = self.person?.photoName ?? ""
            if photoName != "" {
                cell.speakerProfilePictureView.image = UIImage(named: photoName)
            }
            if indexPath.row < self.questionsAndAnswersList.count {
                cell.messageLabel.text = self.questionsAndAnswersList[indexPath.row]
            }
            return cell
        } else {
            let cell = self.conversationTableView.dequeueReusableCell(withIdentifier: "RightMessage", for: indexPath) as! RightMessageViewCell
            if self.person?.photoName != nil && self.person?.photoName != "" {
                cell.speakerProfilePictureView.image = UIImage(named: (self.person?.photoName)!)
            }
            if indexPath.row < self.questionsAndAnswersList.count {
                cell.messageLabel.text = self.questionsAndAnswersList[indexPath.row]
            }
            return cell
        }
    }
    
    
}

extension ProfileViewController : UITableViewDelegate {
    
}
