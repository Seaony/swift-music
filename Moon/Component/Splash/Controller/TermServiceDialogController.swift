//
//  TermServiceDialogController.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit

import TangramKit

class TermServiceDialogController: BaseController, QMUIModalPresentationContentViewControllerProtocol {
    
    var contentContainer: TGBaseLayout!
    
    var modalController: QMUIModalPresentationViewController!
    
    var textView: UITextView!
    
    var disagreeButton: QMUIButton!

    override func initViews() {
        
        super.initViews()
        
        view.layer.cornerRadius = MEDDLE_RADIUS
        view.clipsToBounds = true
        view.backgroundColor = .colorDivider
        view.tg_width.equal(.fill)
        view.tg_height.equal(.wrap)
        
        // 内容容器
        contentContainer = TGLinearLayout(.vert)
        contentContainer.tg_width.equal(.fill)
        contentContainer.tg_height.equal(.wrap)
        contentContainer.tg_space = 25
        contentContainer.backgroundColor = .colorBackground
        contentContainer.tg_padding = UIEdgeInsets(top: PADDING_OUTER, left: PADDING_OUTER, bottom: PADDING_OUTER, right: PADDING_OUTER)
        contentContainer.tg_gravity = TGGravity.horz.center
        view.addSubview(contentContainer)
        
        // 标题
        contentContainer.addSubview(titleView)
        
        // 内容
        textView = UITextView()
        textView.tg_width.equal(.fill)
        textView.tg_height.equal(230)
        textView.text = "中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。中国国家主席习近平已于3月20日抵达莫斯科进行国事访问。在为期三天的国事访问中，两国领导人将就多个议题举行会谈，其中包括加深双边关系、经济领域、国际局势和乌克兰危机等。"
        textView.backgroundColor = .clear
        
        // 禁用编辑
        textView.isEditable = false
        
        contentContainer.addSubview(textView)
        
        // 按钮
        contentContainer.addSubview(primaryButton)
        
        // 不同意按钮
        disagreeButton = ViewFactoryUtil.linkButton()
        disagreeButton.setTitle(R.string.localizable.disagree(), for: .normal)
        disagreeButton.setTitleColor(.black80, for: .normal)
        disagreeButton.addTarget(self, action: #selector(disagreeClick(_:)), for: .touchUpInside)
        disagreeButton.sizeToFit()

        
        contentContainer.addSubview(disagreeButton)
    }
    
    // 不同意按钮的点击
    @objc func disagreeClick (_ sender: QMUIButton) {
        
        self.hide()
        
        // 退出应用
        exit(0)
    }
    
    /// 显示 Modal
    func show() {
        
        modalController = QMUIModalPresentationViewController()
        
        // 设置显示动画
        modalController.animationStyle = .fade
        
        modalController.contentViewMargins = UIEdgeInsets(top: PADDING_LARGE2, left: PADDING_LARGE2, bottom: PADDING_LARGE2, right: PADDING_LARGE2)
        
        // 禁止点击外部隐藏
        modalController.isModal = true
        
        // 设定需要显示的控制器
        modalController.contentViewController = self
        
        modalController.showWith(animated: true)
    }
    
    // 隐藏 Modal
    func hide() {
        
        modalController.hideWith(animated: true)
        
    }
    
    /// 标题
    lazy var titleView: UILabel = {
        
        let r = UILabel()
        r.tg_width.equal(.fill)
        r.tg_height.equal(.wrap)
        r.text = "标题"
        r.textColor = .colorOnSurface
        r.font = UIFont.boldSystemFont(ofSize: TEXT_LARGE2)
        r.textAlignment = .center
        return r
        
    }()
    
    
    // 主按钮
    lazy var primaryButton: QMUIButton = {
        
        let r = ViewFactoryUtil.primaryHalfFilletButton()
        r.setTitle(R.string.localizable.agree(), for: .normal)
        return r
        
    }()
    
}
