//
//  PurchaseViewController.swift
//  Fluff_iOS
//
//  Created by 윤동민 on 2019/12/25.
//  Copyright © 2019 TaeJin Oh. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController {
    @IBOutlet weak var clotheImageView: UIImageView!
    @IBOutlet weak var clotheNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var nameLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var nameLabelLeftConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var nameTextMarginView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactTextMarginView: UIView!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var destinationTextMarginView: UIView!
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var destinationTwoMarginView: UIView!
    @IBOutlet weak var destinationTwoTextField: UITextField!
    @IBOutlet weak var destinationThreeMarginView: UIView!
    @IBOutlet weak var destinationThreeTextField: UITextField!
    @IBOutlet weak var requestMarginView: UIView!
    @IBOutlet weak var requestTextField: UITextField!
    
    @IBOutlet weak var searchAddressButton: UIButton!
    
    @IBOutlet weak var normalAddressCheckButton: UIButton!
    @IBOutlet weak var totalProductPriceLabel: UILabel!
    @IBOutlet weak var deliveryFeeLabel: UILabel!
    @IBOutlet weak var totalPaymentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.topItem?.title = ""
        setConstraint()
        setMarginView()
        setButton()
    }
    
    private func setConstraint() {
        nameLabelTopConstraint.constant = clotheImageView.frame.height / 4.5
        nameLabelLeftConstraint.constant = self.view.frame.width / 34
    }
    
    private func setButton() {
        searchAddressButton.makeCornerRounded(radius: searchAddressButton.frame.width / 10)
        normalAddressCheckButton.layer.borderWidth = 1
        normalAddressCheckButton.layer.borderColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0).cgColor
    }
    
    private func setMarginView() {
        nameTextMarginView.layer.borderColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0).cgColor
        nameTextMarginView.layer.borderWidth = 1
        contactTextMarginView.layer.borderColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0).cgColor
        contactTextMarginView.layer.borderWidth = 1
        destinationTextMarginView.layer.borderColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0).cgColor
        destinationTextMarginView.layer.borderWidth = 1
        destinationTwoMarginView.layer.borderColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0).cgColor
        destinationTwoMarginView.layer.borderWidth = 1
        destinationThreeMarginView.layer.borderColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0).cgColor
        destinationThreeMarginView.layer.borderWidth = 1
        requestMarginView.layer.borderColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0).cgColor
        requestMarginView.layer.borderWidth = 1
        
    }
}
