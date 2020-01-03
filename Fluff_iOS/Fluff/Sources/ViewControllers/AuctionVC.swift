//
//  AuctionVC.swift
//  Fluff_iOS
//
//  Created by 윤동민 on 2019/12/27.
//  Copyright © 2019 TaeJin Oh. All rights reserved.
//

import UIKit

class AuctionVC: UIViewController {

    @IBOutlet weak var auctionCollectionView: UICollectionView!
    
    private var auctionImage: [String] = ["auctionimage1", "auctionimage2", "auctionimage3"]
    private var auctionPrice: [String] = ["260,000", "320,000", "300,000"]
    private var timer: [String] = ["12:32:52", "13:42:55", "00:05:00"]
    
    var firstTimeLeft = 45172
    var secondTimeLeft = 49275
    var thirdTimeLeft = 300
    var timeCounter: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timeCounter = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        
        auctionCollectionView.delegate = self
        auctionCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func onTimerFires()
    {
        firstTimeLeft -= 1
        secondTimeLeft -= 1
        thirdTimeLeft -= 1
        
        timer[0] = secToTime(sec: firstTimeLeft)
        timer[1] = secToTime(sec: secondTimeLeft)
        timer[2] = secToTime(sec: thirdTimeLeft)

    }
    
    func secToTime(sec: Int) -> String {
        let hour = sec / 3600
        let minute = (sec % 3600) / 60
        let second = (sec % 3600) % 60
        
        return String(hour) + ":" + String(minute) + ":" + String(second)
    }

}

extension AuctionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let auctionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "auctionCell", for: indexPath) as? AuctionCollectionViewCell else { return UICollectionViewCell() }
        guard let auctionImage = UIImage(named: auctionImage[indexPath.row]) else { return UICollectionViewCell() }
        
        auctionCell.setInit(auctionImage: auctionImage, timer: timer[indexPath.row], currentPrice: auctionPrice[indexPath.row], auctionItemName: "샤넬 1990's 트위드 자켓")
        
        
        return auctionCell
    }
}

extension AuctionVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let auctionDetailVC = self.storyboard?.instantiateViewController(identifier: "auctionDetailVC") as? AuctionDetailVC else { return }
        auctionDetailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(auctionDetailVC, animated: true)
    }
    
}

extension AuctionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let spacingWidth = collectionView.frame.width / 23.4375
        return UIEdgeInsets(top: 8, left: spacingWidth, bottom: 20, right: spacingWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacingWidth: CGFloat = (collectionView.frame.width / 23.4375) * 2
        let auctionItemWidth: CGFloat = collectionView.frame.width - spacingWidth
        let auctionItemHeight: CGFloat = auctionItemWidth / 1.35
        return CGSize(width: auctionItemWidth, height: auctionItemHeight)
    }
}