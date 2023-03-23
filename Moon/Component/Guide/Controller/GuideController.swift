//
//  GuideController.swift
//  引导界面
//
//  Created by seaony on 2023/3/24.
//

import UIKit
import TangramKit

class GuideController: BaseLogicController {
    
    var bannerView: YJBannerView!
    
    
    override func initViews() {
        
        super.initViews()
        
        initLinearLayoutSafeArea()
        
        container.tg_space = PADDING_OUTER
        
        // 创建轮播图
        bannerView = YJBannerView()
        bannerView.backgroundColor = .clear
        bannerView.dataSource = self
        bannerView.delegate = self
        bannerView.tg_width.equal(.fill)
        bannerView.tg_height.equal(.fill)
        
        //设置如果找不到图片显示的图片
        bannerView.emptyImage=R.image.placeholder()
        
        //设置占位图
        bannerView.placeholderImage=R.image.placeholder()
        
        //设置轮播图内部显示图片的时候调用什么方法
        bannerView.bannerViewSelectorString="sd_setImageWithURL:placeholderImage:"
        
        //设置指示器默认颜色
        bannerView.pageControlNormalColor = .black80
        
        //高亮的颜色
        bannerView.pageControlHighlightColor = .colorPrimary
        
        //重新加载数据
        bannerView.reloadData()
        
        container.addSubview(bannerView)
        
        //按钮容器
        let controlContainer = TGLinearLayout(.horz)
        controlContainer.tg_bottom.equal(PADDING_OUTER)
        controlContainer.tg_width ~= .fill
        controlContainer.tg_height.equal(.wrap)
        
        //水平拉升，左，中，右间距一样
        controlContainer.tg_gravity = TGGravity.horz.among
        container.addSubview(controlContainer)
        
        //登录注册按钮
        let primaryButton = ViewFactoryUtil.primaryButton()
        primaryButton.setTitle(R.string.localizable.loginOrRegister(), for: .normal)
        primaryButton.addTarget(self, action: #selector(primaryClick(_:)), for: .touchUpInside)
        primaryButton.tg_width.equal(BUTTON_WIDTH_MEDDLE)
        controlContainer.addSubview(primaryButton)
        
        //立即体验按钮
        let enterButton = ViewFactoryUtil.primaryOutlineButton()
        enterButton.setTitle(R.string.localizable.experienceNow(), for: .normal)
        enterButton.addTarget(self, action: #selector(enterClick(_:)), for: .touchUpInside)
        enterButton.tg_width.equal(BUTTON_WIDTH_MEDDLE)
        controlContainer.addSubview(enterButton)
        
    }
    
    
    // 登录/注册按钮被点击
    @objc func primaryClick (_ sender: QMUIButton) {
        AppDelegate.shared.toLogin()
    }
    
    // 立即体验按钮被点击
    @objc func enterClick (_ sender: QMUIButton) {
        AppDelegate.shared.toMain()
    }
    
}

// MARK: - YJBannerViewDataSource
extension GuideController: YJBannerViewDataSource {
    
    
    /// banner数据源
    ///
    /// - Parameter bannerView: <#bannerView description#>
    /// - Returns: <#return value description#>
    func bannerViewImages(_ bannerView: YJBannerView!) -> [Any]! {
        
        return ["guide1", "guide2", "guide3", "guide4", "guide5"]
        
    }
    
    /// 自定义Cell
    /// 复写该方法的目的是
    /// 设置图片的缩放模式
    ///
    /// - Parameters:
    ///   - bannerView: <#bannerView description#>
    ///   - customCell: <#customCell description#>
    ///   - index: <#index description#>
    /// - Returns: <#return value description#>
    func bannerView(_ bannerView: YJBannerView!, customCell: UICollectionViewCell!, index: Int) -> UICollectionViewCell! {
        //将cell类型转为YJBannerViewCell
        let cell = customCell as! YJBannerViewCell
        
        //设置图片的缩放模式为
        //从中心填充
        //多余的裁剪掉
        cell.showImageViewContentMode = .scaleAspectFit
        
        return cell
    }
    
}

// MARK: - YJBannerViewDelegate
extension GuideController: YJBannerViewDelegate {
    
}
