//
//  DiscoveryButtonView.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit
import TangramKit

class DiscoveryButtonView: TGLinearLayout {

    init() {
        
        super.init(frame: CGRect.zero, orientation: .vert)
        
        initViews()
        
    }
        
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        initViews()
    }
    
    func initViews() {
        tg_width.equal(.wrap)
        tg_height.equal(.wrap)
        
        tg_space = PADDING_MEDDLE
        
        tg_gravity = TGGravity.horz.center
        
        // 添加其他控件
        let iconContainer = TGRelativeLayout()
        iconContainer.tg_width.equal(50)
        iconContainer.tg_height.equal(50)
        
        addSubview(iconContainer)
        
        iconContainer.addSubview(iconView)
        iconContainer.addSubview(tipView)
        
        addSubview(titleView)
    }
    
    lazy var iconView: UIImageView = {
        
        let r = UIImageView()
        r.tg_width.equal(.fill)
        r.tg_height.equal(.fill)
        r.image = R.image.dayRecommend()
        
        return r
        
    }()
    
    lazy var tipView: UILabel = {
        
        let r = UILabel()
        r.tg_width.equal(.wrap)
        r.tg_height.equal(.wrap)
        r.textColor = .colorLightWhite
        r.font = UIFont.systemFont(ofSize: 13)
        // r.text = "6"
        
        r.tg_centerX.equal(0)
        r.tg_centerY.equal(3)
        
        return r
        
    }()
    
    
    lazy var titleView: UILabel = {
        
        let r = UILabel()
        r.tg_width.equal(.wrap)
        r.tg_height.equal(.wrap)
        r.textColor = .colorOnSurface
        r.font = UIFont.systemFont(ofSize: 13)
        r.text = "今日推荐"
        
        return r
        
    }()
    
    func bind (_ title: String!, _ icon: UIImage!) {
        titleView.text = title
        iconView.image = icon
    }
    
}
