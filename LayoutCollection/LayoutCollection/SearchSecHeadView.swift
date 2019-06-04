//
//  SearchSecHeadView.swift
//  LayoutCollection
//
//  Created by mac on 2019/6/2.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit

class SearchSecHeadView: UICollectionReusableView {
    static let identifier = "SearchSecHeadView"
    
    private var titleView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    var titleLable: UILabel = {
        let lable = UILabel()
        lable.textColor = UIColor.darkText
        lable.text = "历史搜索"
        lable.font = UIFont.boldSystemFont(ofSize: 13)
        return lable
    }()
    let rightButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "time"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        addSubview(titleView)
        titleView.addSubview(titleLable)
        titleView.addSubview(rightButton)
        titleView.frame = self.bounds
        titleLable.frame = CGRect(x: 10, y: 0, width: self.bounds.width - 90, height: 40)
        rightButton.frame =  CGRect(x: self.bounds.width - 90 , y: 0, width: 60, height: 40)
    }
    
}
