//
//  ViewController.swift
//  LayoutCollection
//
//  Created by mac on 2019/6/2.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit

class SearchItemLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        //cell数据离头距离
        self.sectionInset = UIEdgeInsets(top: 5, left: 15, bottom: 0, right: 15)
        //每组头的大小
        self.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 35)
        self.minimumInteritemSpacing = 15
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let arrCell = super.layoutAttributesForElements(in: rect)
        if arrCell == nil { return nil }
        for i in 1 ..< arrCell!.count {
            //当前 UICollectionViewLayoutAttributes
            let currentLayout = arrCell![i]
            //上一个 UICollectionViewLayoutAttributes
            let prevLayout = arrCell![i - 1]
            if (prevLayout.indexPath.section == currentLayout.indexPath.section) {
                //我们想设置的最大间距，可根据需要改
                let maximumSpacing = 15
                //前一个cell的最右边
                let originX = prevLayout.frame.maxX
                //如果当 （上一个cell的最右边X + 我们想要的间距 + 当前cell的宽度 + 区边距） 依然在contentSize中 (小于屏幕宽度)，我们改变当前cell的原点位置
                //判断 当前cell的 maxX 是否超出屏幕
                if((CGFloat(originX) + CGFloat(maximumSpacing) + currentLayout.frame.size.width) + self.sectionInset.right < self.collectionViewContentSize.width)  {
                    var frame = currentLayout.frame
                    frame.origin.x = CGFloat(originX) + CGFloat(maximumSpacing)
                    currentLayout.frame = frame
                } else {
                    print("超出屏幕, 换一行")
                    var frame = currentLayout.frame
                    frame.origin.x = self.sectionInset.left
                    currentLayout.frame = frame
                }
            }
        }
        return arrCell
    }
    
}
