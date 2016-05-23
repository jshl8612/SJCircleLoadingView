//
//  RoundView.swift
//  RoundLoadingView
//
//  Created by JiangShenglong on 16/5/23.
//  Copyright © 2016年 JiangShenglong. All rights reserved.
//

import UIKit

class CircleView: UIView {

    var color : UIColor = UIColor.lightGrayColor()
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let path = UIBezierPath(ovalInRect: rect)
        color.setFill()
//        UIColor.greenColor().setFill()
        
        path.fill()
    }
    
    init(frame: CGRect, color : UIColor) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
        self.color = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
