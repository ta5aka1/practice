//
//  ViewController.swift
//  Simple Colection
//
//  Created by Takayasu Sakai on 2015/11/28.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource{
    var collectionView:UICollectionView!
    let flowLayout = UICollectionViewFlowLayout()
    let imageItems = ["arrow73.png", "clock96.png", "close13.png", "email20.png", "garbage12.png", "handshake1.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //レイアウト作成
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Vertical
        flowLayout.minimumInteritemSpacing = 5.0
        flowLayout.minimumLineSpacing = 5.0
        flowLayout.itemSize = CGSizeMake(100, 100)
        flowLayout.headerReferenceSize = CGSizeMake(0, 50)
        
        //コレクションビュー作成
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
        collectionView.registerClass(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        //collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        // AutoLayout制約を追加
        setupConstraints()
    }
    
    private func setupConstraints(){
        var viewConstraints = [NSLayoutConstraint]()
        
        //コレクションビューの制約
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        viewConstraints.append(NSLayoutConstraint(item: collectionView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: collectionView, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: collectionView, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: collectionView, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0.0))
        
        //ビューに制約を追加
        view.addConstraints(viewConstraints)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    //すべての回転方向を認識させる
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.All
    }
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        //画面回転したらCollectionViewのスクロール方向を変更する
        //処理が行われたかわかりづらいので、collectionViewの背景色を画面方向によって変更。
        if toInterfaceOrientation == .Portrait || toInterfaceOrientation == .PortraitUpsideDown{
            flowLayout.scrollDirection = .Vertical
            collectionView.backgroundColor = UIColor.blackColor()
        } else if toInterfaceOrientation == .LandscapeLeft || toInterfaceOrientation == .LandscapeRight {
            flowLayout.scrollDirection = .Horizontal
            collectionView.backgroundColor = UIColor.whiteColor()
        }else{
            //画面回転方向がunknownの時は縦にスクロール
            flowLayout.scrollDirection = .Vertical
            collectionView.backgroundColor = UIColor.blackColor()
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageItems.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCell", forIndexPath: indexPath) as! ImageCollectionViewCell
        cell.setupContents(indexPath.row, filePath: imageItems[indexPath.row])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headerReusableView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "header", forIndexPath: indexPath) as UICollectionReusableView
        headerReusableView.backgroundColor = UIColor.blueColor()
        return headerReusableView
    }

}

