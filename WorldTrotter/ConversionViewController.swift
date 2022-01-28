//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Xin Xiong on 2022/1/27.
//

import UIKit

class ConversionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ConversionViewController loaded its view.")
        
    }
    
/*
    /* Chapter2: Silver Challenge */
    override func viewWillLayoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        /*
         * 注意：如果用addSublayer则渐变层会在最顶层
         */
        self.view.layer.insertSublayer(gradientLayer, at: 0)
//        self.view.layer.addSublayer(gradientLayer)
        
        gradientLayer.colors = [UIColor.red.cgColor,
                                UIColor.yellow.cgColor,
                                UIColor.green.cgColor,
                                UIColor.blue.cgColor,
                                UIColor.purple.cgColor
                                ]
        /*
         * 网上抄过来的：
         *
         * 颜色分布：
         * 从0到第一个值，保持第一种颜色；
         * 从最后一个值到1，保持最后一种颜色；
         * 从n->n+1，完成从 第n个颜色 到 第n+1个颜色 的变换；
         */
        let arr = [
            0.2,
            0.4,
            0.6,
            0.8
        ]
        gradientLayer.locations = arr as [NSNumber]?
             
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 1) // 左上角
        gradientLayer.endPoint = CGPoint.init(x: 0, y: 0) // 右上角
        
        /* 从官方文档抄过来的，转180度即可 */
//        gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi, 0, 0, 0)
    }
*/

/*
    /* Chapter 3 Silver Challenge */
    override func viewWillAppear(_ animated: Bool) {
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        self.view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        super.viewWillAppear(animated)
    }
*/
    
}

