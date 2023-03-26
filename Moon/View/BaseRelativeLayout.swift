//
//  BaseRelativeLayout.swift
//  MyCloudMusic
//
//  Created by smile on 2022/7/7.
//

import UIKit
import TangramKit

class BaseRelativeLayout: TGRelativeLayout {
    init() {
        super.init(frame: .zero)
        initViews()
        initDatum()
        initListeners()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
