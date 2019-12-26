//
//  FollowingTableViewCell.swift
//  Fluff_iOS
//
//  Created by 윤동민 on 2019/12/26.
//  Copyright © 2019 TaeJin Oh. All rights reserved.
//

import UIKit

class FollowingTableViewCell: UITableViewCell {
    @IBOutlet weak var fluvNameLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var oneTagLabel: UILabel!
    @IBOutlet weak var twoTagLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var followButtonWidthConstraint: NSLayoutConstraint!
    
    func setInit() {
        oneTagLabel.layer.borderColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0).cgColor
        twoTagLabel.layer.borderColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0).cgColor
        oneTagLabel.textColor = .black
        twoTagLabel.textColor = .black
    }
    
    func setFluvName(_ name: String) {
        fluvNameLabel.text = name
    }
    
    func setFollowerCountLabel(_ count: String) {
        followerCountLabel.text = "팔로워 " + count + "명"
    }
    
    func setOneTagLabel(_ tag: String) {
        oneTagLabel.text = tag
    }
    
    func setTwoTagLabel(_ tag: String) {
        twoTagLabel.text = tag
    }
    
    func setFollowButton(isFollow: Bool) {
        followButton.makeCornerRounded(radius: 10)
        
        if isFollow {
            // 팔로우 취소 누르는 버튼
            followButton.layer.borderColor = UIColor(red: 183/255, green: 183/255, blue: 183/255, alpha: 1.0).cgColor
            followButton.layer.borderWidth = 1
            followButtonWidthConstraint.constant = self.frame.width / CGFloat(4.734)
            followButton.titleLabel?.textColor = UIColor(red: 183/255, green: 183/255, blue: 183/255, alpha: 1)
            followButton.titleLabel?.text = "팔로우 취소"
            followButton.backgroundColor = .blue
        } else {
            // 팔로우 누르는 버튼
            followButton.layer.borderColor = UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1.0).cgColor
            followButton.layer.borderWidth = 1
            followButton.backgroundColor = UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1.0)
            followButton.titleLabel?.textColor = .white
            followButtonWidthConstraint.constant = self.frame.width / CGFloat(6.684)
            followButton.titleLabel?.text = "팔로우"
        }
    }
    
    @IBAction func clickFollowButton(_ sender: Any) {
//        if isFollow {
//            // 팔로우 버튼 클릭 ==> 팔로우 취소 버튼으로 바뀜
//        } else {
//            // 필로우취소 버튼 클릭 ==> 팔로우 버튼으로 바뀜
//        }
    }
}