//
//  BaseLogicController.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

//提供类似Android中更高层级布局框架
import TangramKit

class BaseLogicController: BaseCommonController {
    
    /// 根容器
    var rootContainer: TGBaseLayout!
    
    /// 头部容器&内容容器
    var superHeaderContainer: TGBaseLayout!
    var superHeaderContentContainer: TGBaseLayout!
    
    /// 内容容器
    var container: TGBaseLayout!
    
    /// 底部容器&内容容器
    var superFooterContainer: TGBaseLayout!
    var superFooterContentContainer: TGBaseLayout!
    
    /// 初始化RelativeLayout容器，四边都在安全区内
    func initRelativeLayoutSafeArea() {
        
        initLinearLayout()
        
        //header
        initHeaderContainer()
        
        container = TGRelativeLayout()
        container.tg_width.equal(.fill)
        container.tg_height.equal(.fill)
        container.backgroundColor = .clear
        rootContainer.addSubview(container)
        
        initFooterContainer()
        
    }
    
    /// 初始化垂直方向 LinearLayout 容器，四边都在安全区内
    func initLinearLayoutSafeArea () {
        
        initLinearLayout()
        initHeaderContainer()
        
        container = TGLinearLayout(.vert)
        container.tg_width.equal(.fill)
        container.tg_height.equal(.fill)
        container.backgroundColor = .clear
        rootContainer.addSubview(container)
        
        initFooterContainer()
    }
    
    /// 初始化垂直方向 LinearLayout 容器
    func initLinearLayout () {
        
        rootContainer = TGLinearLayout(.vert)
        rootContainer.tg_width.equal(.fill)
        rootContainer.tg_height.equal(.fill)
        rootContainer.backgroundColor = .clear
        view.addSubview(rootContainer)
        
    }
    
    /// 初始化 Header 容器，在安全区外，一般用到设置头部到安全区的颜色
    func initHeaderContainer() {
        
        superHeaderContainer = TGLinearLayout(.vert)
        superHeaderContainer.tg_width.equal(.fill)
        superHeaderContainer.tg_height.equal(.wrap)
        superHeaderContainer.backgroundColor = .clear
        
        // 头部内容容器
        superHeaderContentContainer = TGLinearLayout(.vert)
        superHeaderContentContainer.tg_height.equal(.wrap)
        superHeaderContentContainer.tg_leading.equal(TGLayoutPos.tg_safeAreaMargin)
        superHeaderContentContainer.tg_trailing.equal(TGLayoutPos.tg_safeAreaMargin)
        superHeaderContentContainer.tg_top.equal(TGLayoutPos.tg_safeAreaMargin)
        superHeaderContentContainer.backgroundColor = .clear
        
        superHeaderContainer.addSubview(superHeaderContentContainer)
        rootContainer.addSubview(superHeaderContainer)
        
    }
    
    /// 初始化底部内容容器
    func initFooterContainer() {
        
        superFooterContainer = TGLinearLayout(.vert)
        superFooterContainer.tg_width.equal(.fill)
        superFooterContainer.tg_height.equal(.wrap)
        superFooterContainer.backgroundColor = .clear
        
        // 头部内容容器
        superFooterContentContainer = TGLinearLayout(.vert)
        superFooterContentContainer.tg_height.equal(.wrap)
        superFooterContentContainer.tg_leading.equal(TGLayoutPos.tg_safeAreaMargin)
        superFooterContentContainer.tg_trailing.equal(TGLayoutPos.tg_safeAreaMargin)
        superFooterContentContainer.tg_bottom.equal(TGLayoutPos.tg_safeAreaMargin)
        superFooterContentContainer.backgroundColor = .clear
        
        superFooterContainer.addSubview(superFooterContentContainer)
        rootContainer.addSubview(superFooterContainer)
        
    }
    
    override func initViews() {
        
        super.initViews()
        
        // 默认背景颜色
        setBackgroundColor(.colorBackground)

        
    }
    
}