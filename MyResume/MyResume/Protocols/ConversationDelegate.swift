//
//  ConversationDelegate.swift
//  MyResume
//
//  Created by Anissa Bokhamy on 10/09/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import Foundation

protocol ConversationDelegate {
    func personDidAnswer()
    func userDidAskQuestion(_ question : String)
}
