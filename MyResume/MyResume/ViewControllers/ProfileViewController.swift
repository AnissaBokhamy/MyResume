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
    //@IBOutlet weak var questionOptionsStackView: UIStackView!
    @IBOutlet weak var questionOptionsCollectionView: UICollectionView!
    
    
    var person : Person?
    var personIsLookingForAnswer = false
    
    var questionsAndAnswersList = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.conversationTableView.delegate = self
        self.conversationTableView.dataSource = self
        //self.conversationTableView.register(LeftMessageViewCell.self, forCellReuseIdentifier: "LeftMessage")
        //self.conversationTableView.register(RightMessageViewCell.self, forCellReuseIdentifier: "RightMessage")
        
        self.questionOptionsCollectionView.dataSource = self
        
        self.person = Person()
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
        self.questionOptionsCollectionView.isHidden = true
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
            // Person is talking / answering
            let cell = self.conversationTableView.dequeueReusableCell(withIdentifier: "LeftMessage", for: indexPath) as! LeftMessageViewCell
            let photoName = self.person?.photoName ?? ""
            if photoName != "" {
                cell.speakerProfilePictureView.image = UIImage(named: photoName)
            }
            // TODO add loading view
            /*if self.personIsLookingForAnswer {
                
            }*/
            if indexPath.row < self.questionsAndAnswersList.count {
                cell.messageLabel.text = self.questionsAndAnswersList[indexPath.row]
                cell.messageLabel.sizeToFit()
            }
            return cell
        } else {
            // User is asking a question
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


// Display of questions
extension ProfileViewController : ConversationDelegate {
    func personDidAnswer() {
        self.questionsAndAnswersList.append("...")
        //self.questionOptionsStackView.isHidden = false
        self.questionOptionsCollectionView.isHidden = false
        self.conversationTableView.reloadData()
    }
    
    func userDidAskQuestion(_ question: String) {
        if self.questionsAndAnswersList.last == "..." {
            // add question to stack view
            let last = self.questionsAndAnswersList.popLast()
            print(last)
            self.questionsAndAnswersList.append(question)
            self.conversationTableView.reloadData()
            //self.questionOptionsStackView.isHidden = true
            self.questionOptionsCollectionView.isHidden = true
            
            // loading and find the appropriate answer
            self.personIsLookingForAnswer = true
            //self.questionOptionsStackView.
            
            
        }
    }
}

extension ProfileViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.person?.questions?.filter{ !($0.hasAlreadyBeenAsked) }.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.questionOptionsCollectionView.dequeueReusableCell(withReuseIdentifier: "QuestionOptionCell", for: indexPath) as! QuestionOptionsCollectionViewCell
        
        let questionsToDisplay = self.person?.questions?.filter{ !($0.hasAlreadyBeenAsked) }
        
        cell.questionButton.setTitle(questionsToDisplay?[indexPath.row].question, for: .normal)
        
        return cell
    }
}
