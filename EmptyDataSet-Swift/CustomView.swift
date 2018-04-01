//
//  CustomViewWithXib.swift
//  EmptyDataSet-Swift
//
//  Created by YZF on 2018/3/31.
//  Copyright © 2018年 Xiaoye. All rights reserved.
//

import UIKit

class CustomView: UIView {

    @IBOutlet var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadViewFromXib() {
        //该代码会把 owner 的类中的 IBOutlet 都按照 xib 初始化
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        view.frame = bounds
        addSubview(view)
    }

}
