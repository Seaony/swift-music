//
//  BaseController.swift
//  所有控制器的父类
//
//  Created by seaony on 2023/3/24.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initViews()
        initDatum()
        initListeners()
    }
    

    /// 找控件
    func initViews() {
        
    }
    
    /// 设置数据
    func initDatum() {
        
    }
    
    /// 设置监听器
    func initListeners()  {
        
    }

}
