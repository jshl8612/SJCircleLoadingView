//
//  CircleLoadingView.swift
//  RoundLoadingView
//
//  Created by JiangShenglong on 16/5/23.
//  Copyright © 2016年 JiangShenglong. All rights reserved.
//

import UIKit

class CircleLoadingView: UIView {

    var colorList : [UIColor] = []
    
    var currentIndex : Int = 0;
    
    var timerDuration : NSTimeInterval = 1;
    
    var animationDuration : NSTimeInterval = 3;
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
    private var timer : NSTimer?
    
    
    override func awakeFromNib() {
        setupColors()
    }
    
    private func setupColors() {
        let color1 = UIColor(red: 100, green: 106, blue: 102, alpha: 0.3)
        let color2 = UIColor(red: 147, green: 150, blue: 152, alpha: 0.3)
        
        colorList = [color1, color2]
    }
    
    func startAnimation() {
        setupTimer()
        //        timer?.fire()
    }
    
    func stopAnimation() {
        if timer != nil {
            timer?.invalidate()
        }
    }
    
    private func setupTimer() {
        //        self.runAnimation()
        runAnimation()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(timerDuration, target: self, selector: #selector(CircleLoadingView.runAnimation), userInfo: nil, repeats: true)
    }
    
    @objc private func runAnimation() {
        
        let color = colorList[currentIndex%colorList.count]
        
        let circleView = CircleView(frame: self.circleMinFrame(), color: color)

        self.addSubview(circleView)
        currentIndex += 1
        
        UIView.animateWithDuration(animationDuration, animations: {
            circleView.frame = self.circleMaxFrame()
            circleView.alpha = 0
            
            }) { (finished) in
                
                circleView.removeFromSuperview()
        }

    }
    
    private func circleMinFrame() -> CGRect {
        var minFrame = CGRectZero
        let minRadius: CGFloat = min(self.frame.width/20 , self.frame.height/20)
        
        minFrame.origin.x = self.frame.width/2 - minRadius
        minFrame.origin.y = self.frame.height/2 - minRadius
        minFrame.size = CGSizeMake(minRadius*2, minRadius*2)
        
        return minFrame
    }
    
    private func circleMaxFrame() -> CGRect {
        var maxFrame = CGRectZero
        let maxRadius = max(self.frame.width/3 , self.frame.height/3)
        maxFrame.origin.x = self.frame.width/2 - maxRadius
        maxFrame.origin.y = self.frame.height/2 - maxRadius
        maxFrame.size = CGSizeMake(maxRadius*2, maxRadius*2)
        
        return maxFrame
    }
    

}
