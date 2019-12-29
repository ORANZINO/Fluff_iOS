//
//  HomeVC.swift
//  Fluff_iOS
//
//  Created by TaeJin Oh on 2019/12/25.
//  Copyright © 2019 TaeJin Oh. All rights reserved.
//

import UIKit
import CHIPageControl

class HomeVC: UIViewController {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var bannerPageControl: CHIPageControlJalapeno!
    @IBOutlet weak var todayCollectionView: UICollectionView!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var recentCollectionView: UICollectionView!
    @IBOutlet weak var recentLabel: UILabel!
    @IBOutlet weak var howFluvLabel: UILabel!
    @IBOutlet weak var howFluvCollectionView: UICollectionView!
    @IBOutlet weak var nowAuctionCollectionView: UICollectionView!
    @IBOutlet weak var nowAuctionLabel: UILabel!
    @IBOutlet weak var todayVintageLabel: UILabel!
    @IBOutlet weak var todayVintageCollectionView: UICollectionView!
    @IBOutlet weak var keywordLabel: UILabel!
    @IBOutlet weak var keyWordTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sCoreMedium = UIFont(name: "S-CoreDream-5Medium", size: 24)
        let sCoreExtraLight = UIFont(name: "S-CoreDream-2ExtraLight", size: 24)
        let forYou: String = "당신을 위한 "
        var whatSeen = String()
        let recommendVintage: String = "의 추천 빈티지"
        var dayOfTheWeek = String()
        whatSeen = "무스탕"
        dayOfTheWeek = "화요일"
        
        let attributes: [NSAttributedString.Key: Any] = [.kern: -1.44, .font: sCoreMedium as Any]
        
        let recentAttributedStr = NSMutableAttributedString(string: forYou + whatSeen)
        
        let howFluvAttributedStr = NSMutableAttributedString(string: howFluvLabel.text!)
        
        let nowAuctionAttributedStr = NSMutableAttributedString(string: nowAuctionLabel.text!)
        
        let todayVintageAttributedStr = NSMutableAttributedString(string: dayOfTheWeek + recommendVintage)
        
        let keywordAttributedStr = NSMutableAttributedString(string: keywordLabel.text!)
        
        recentAttributedStr.addAttributes(attributes, range: NSRange(location: 7, length: whatSeen.count))
        howFluvAttributedStr.addAttributes(attributes, range: NSRange(location: 3, length: 2))
        nowAuctionAttributedStr.addAttributes(attributes, range: NSRange(location: 8, length: 2))
        todayVintageAttributedStr.addAttributes(attributes, range: NSRange(location: 0, length: 3))
        keywordAttributedStr.addAttributes(attributes, range: NSRange(location: 4, length: 2))
        
        
        recentLabel.attributedText = recentAttributedStr
        howFluvLabel.attributedText = howFluvAttributedStr
        nowAuctionLabel.attributedText = nowAuctionAttributedStr
        todayVintageLabel.attributedText = todayVintageAttributedStr
        keywordLabel.attributedText = keywordAttributedStr
        
        bannerCollectionView.dataSource = self
        todayCollectionView.dataSource = self
        recentCollectionView.dataSource = self
        howFluvCollectionView.dataSource = self
        nowAuctionCollectionView.dataSource = self
        todayVintageCollectionView.dataSource = self
        self.keyWordTableView.dataSource = self as! UITableViewDataSource
        howFluvCollectionView.delegate = self
        bannerCollectionView.delegate = self
       bannerCollectionView.showsHorizontalScrollIndicator = false
        todayCollectionView.showsHorizontalScrollIndicator = false

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

}

extension HomeVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let bannerImgList: [UIImage] = [#imageLiteral(resourceName: "beccaMchaffieFzde6ITjkwUnsplash2"),#imageLiteral(resourceName: "beccaMchaffieFzde6ITjkwUnsplash2"),#imageLiteral(resourceName: "beccaMchaffieFzde6ITjkwUnsplash2"),#imageLiteral(resourceName: "beccaMchaffieFzde6ITjkwUnsplash2")]
        let todayImgList: [UIImage] = [#imageLiteral(resourceName: "84"), #imageLiteral(resourceName: "416"), #imageLiteral(resourceName: "416"), #imageLiteral(resourceName: "84")]
        let recentImgList: [UIImage] = [#imageLiteral(resourceName: "kakaoTalkPhoto2019121905141717"),#imageLiteral(resourceName: "kakaoTalkPhoto2019121905141716"),#imageLiteral(resourceName: "kakaoTalkPhoto2019121905141717"),#imageLiteral(resourceName: "kakaoTalkPhoto2019121905141716")]
        let howFluvImgList: [UIImage] = [#imageLiteral(resourceName: "20191217110715"),#imageLiteral(resourceName: "20191217110715"),#imageLiteral(resourceName: "20191217110715"),#imageLiteral(resourceName: "20191217110715")]
        let nowAuctionImgList: [UIImage] = [#imageLiteral(resourceName: "111"),#imageLiteral(resourceName: "110"),#imageLiteral(resourceName: "111"),#imageLiteral(resourceName: "110")]
        let todayVintageImgList: [UIImage] = [#imageLiteral(resourceName: "kakaoTalkPhoto2019121905141728"),#imageLiteral(resourceName: "kakaoTalkPhoto201912190514179"),#imageLiteral(resourceName: "kakaoTalkPhoto2019121905141728"),#imageLiteral(resourceName: "kakaoTalkPhoto201912190514179")]
        let howFluvNameList: [String] = ["화자네 빈티지", "호준호준", "허정마니바니", "한나는하나"]
        let todayProductList: [String] = ["빗살무늬 폴로 셔츠", "다홍꽃 주렁주렁 가디건", "빗살무늬 폴로 셔츠", "다홍꽃 주렁주렁 가디건"]
        let nowAuctionItemList: [String] = ["Yves Saint Laurent 원피스", "MaxMara 만다린 자켓", "Yves Saint Laurent 원피스", "MaxMara 만다린 자켓"]
        let nowAuctionTimeList: [String] = ["곧 경매 종료", "종료까지 2시간", "곧 경매 종료", "종료까지 2시간"]
        let todayVintageProductList: [String] = ["오베이 갈매기 패턴 캠프캡", "폴로 스포츠 블루 덕다운 패딩", "오베이 갈매기 패턴 캠프캡", "폴로 스포츠 블루 덕다운 패딩"]
        
        switch collectionView {
            
        case self.todayCollectionView:
            print("todayCollectionview")
            let todayCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayCollectionViewCell", for: indexPath) as! TodayCollectionViewCell
        todayCollectionViewCell.todayImage.image = todayImgList[indexPath.row]
        todayCollectionViewCell.todayProductLabel.text = todayProductList[indexPath.row]
            return todayCollectionViewCell
            
        case self.bannerCollectionView:
            print("bannerCollectionView")
            let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
            
            bannerCell.bannerImg.image = bannerImgList[indexPath.row]
            return bannerCell
        
        case self.recentCollectionView:
        print("recentCollectionView")
            let recentCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentCollectionViewCell", for: indexPath) as! RecentCollectionViewCell
        
        recentCollectionViewCell.recentImage.image = recentImgList[indexPath.row]
        recentCollectionViewCell.recentProductLabel.text = todayProductList[indexPath.row]
            return recentCollectionViewCell
            
        case self.howFluvCollectionView:
            let howFluvCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HowFluvCollectionViewCell", for: indexPath) as! HowFluvCollectionViewCell
            
            howFluvCollectionViewCell.fluvProfileImage.image = howFluvImgList[indexPath.row]
            howFluvCollectionViewCell.fluvName.text = howFluvNameList[indexPath.row]
            
            howFluvCollectionViewCell.howFluvView.backgroundColor = UIColor.white
            howFluvCollectionViewCell.howFluvView.layer.borderColor = UIColor.borderGrey.cgColor
            
            howFluvCollectionViewCell.howFluvView.layer.borderWidth = 1
        
            return howFluvCollectionViewCell
            
        case self.nowAuctionCollectionView:
            let nowAuctionCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NowAuctionCollectionViewCell", for: indexPath) as! NowAuctionCollectionViewCell
            
            nowAuctionCollectionViewCell.nowAuctionImage.image = nowAuctionImgList[indexPath.row]
            
            nowAuctionCollectionViewCell.nowAuctionGradient.image = #imageLiteral(resourceName: "478")
            nowAuctionCollectionViewCell.nowAuctionItem.text = nowAuctionItemList[indexPath.row]
            
            nowAuctionCollectionViewCell.nowAuctionTime.text = nowAuctionTimeList[indexPath.row]
            
            return nowAuctionCollectionViewCell
        case self.todayVintageCollectionView:
            let todayVintageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayVintageCollectionViewCell", for: indexPath) as! TodayVintageCollectionViewCell
            
            todayVintageCollectionViewCell.todayVintageImage.image = todayVintageImgList[indexPath.row]
            todayVintageCollectionViewCell.todayVintageProductLabel.text = todayVintageProductList[indexPath.row]
                return todayVintageCollectionViewCell
            
        default:
        return UICollectionViewCell()
        }
    }
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch collectionView {
        case self.bannerCollectionView:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case self.howFluvCollectionView:
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        default:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case self.howFluvCollectionView:
            return 12
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case self.howFluvCollectionView:
            return 12
        default:
            return 0
        }
        
    }
}

extension HomeVC: UICollectionViewDelegate {

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / self.bannerCollectionView.frame.width)
      self.bannerPageControl.set(progress: page, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "homeDetailVC") as? BannerIntoVC else { return }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}


extension HomeVC: UITableViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let keywordList: [String] = ["# 스카프", "# 데님자켓", "# 중절모"]
        
        let keywordTableViewCell = tableView.dequeueReusableCell(withIdentifier: "KeywordTableViewCell", for: indexPath) as! KeywordTableViewCell
        keywordTableViewCell.keywordButton.setTitle(keywordList[indexPath.row], for: .normal)
        
        keywordTableViewCell.keywordImageView.image = #imageLiteral(resourceName: "105")
        
        return keywordTableViewCell
    }
}
