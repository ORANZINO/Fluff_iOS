//
//  LoginVC.swift
//  Fluff_iOS
//
//  Created by TaeJin Oh on 2019/12/23.
//  Copyright © 2019 TaeJin Oh. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var idTextView: UITextView!
    @IBOutlet weak var pwdTextView: UITextView!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialButton()
    }
    
    private func initialButton() {
        loginButton.makeCornerRounded(radius: loginButton.frame.width / 15)
        idTextView.makeCornerRounded(radius: idTextView.frame.width / 15)
        pwdTextView.makeCornerRounded(radius: pwdTextView.frame.width / 15)
    }
}
