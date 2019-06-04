//
//  ViewController.swift
//  LayoutCollection
//
//  Created by mac on 2019/6/2.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: self.view.bounds, collectionViewLayout: SearchItemLayout())
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.clear
        collection.register(SearcHotCell.classForCoder(), forCellWithReuseIdentifier: SearcHotCell.cellId)
        collection.register(SearchSecHeadView.classForCoder(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchSecHeadView.identifier)
        return collection
    }()
    var titles = ["最近搜索","最近","最近搜索最近","最近sou搜","最近搜索最","最近搜","最","最近搜索最近搜索","最近搜索最近搜索","最近搜","最近搜索","最索最近","最近搜索最近","最近搜索最近搜索","最近"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }

    func getwith(font: UIFont, height: CGFloat, string: String) -> CGSize {
        let size = CGSize.init(width: CGFloat(MAXFLOAT), height: height)
        let dic = [NSAttributedString.Key.font: font] // swift 4.2
        let strSize = string.boundingRect(with: size, options: [.usesLineFragmentOrigin], attributes: dic, context:nil).size
        return strSize
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearcHotCell.cellId, for: indexPath) as! SearcHotCell
        cell.titleLab.text = titles[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = self.getwith(font: UIFont.systemFont(ofSize: 12), height: 24, string: titles[indexPath.item])
        return CGSize(width: size.width + 30, height: 30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableView:UICollectionReusableView?
        //是每组的头
        if kind == UICollectionView.elementKindSectionHeader {
            let searchReusable = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchSecHeadView.identifier, for: indexPath) as! SearchSecHeadView
            
            reusableView = searchReusable
        }
        return reusableView!
    }
    
}
