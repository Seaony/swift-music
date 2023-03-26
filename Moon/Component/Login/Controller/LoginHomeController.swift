//
//  LoginHomeController.swift
//  登录主界面
//
//  Created by seaony on 2023/3/24.
//

import UIKit
import BSText
import TangramKit

class LoginHomeController: BaseTitleController {

    override func initViews() {

        super.initViews()

        initRelativeLayoutSafeArea()

        //logo
        let iconView = UIImageView(image: R.image.logo())
        iconView.tg_width.equal(100)
        iconView.tg_height.equal(100)
        iconView.tg_centerX.equal(0)
        iconView.tg_top.equal(80)
        container.addSubview(iconView)

        //底部容器
        initBottomContainer()

    }

    func initBottomContainer() {
        let container = TGLinearLayout(.vert)
        container.tg_width.equal(.fill)
        container.tg_height.equal(.wrap)
        container.tg_space = PADDING_LARGE2
        container.tg_leadingPadding = PADDING_LARGE2
        container.tg_trailingPadding = PADDING_LARGE2
        container.tg_bottom.equal(PADDING_LARGE2)
        container.tg_gravity = TGGravity.horz.center
        self.container.addSubview(container)

        //手机号登录
        let phoneLoginButton = ViewFactoryUtil.primaryHalfFilletButton()
        phoneLoginButton.setTitle(R.string.localizable.phoneLogin(), for: .normal)
        phoneLoginButton.addTarget(self, action: #selector(onPhoneLoginClick(_:)), for: .touchUpInside)
        container.addSubview(phoneLoginButton)

        //用户名和密码登录
        let usernameLoginButton = ViewFactoryUtil.primaryHalfFilletOutlineButton()
        usernameLoginButton.setTitle(R.string.localizable.usernameLogin(), for: .normal)
        usernameLoginButton.addTarget(self, action: #selector(onUsernameClick(_:)), for: .touchUpInside)
        container.addSubview(usernameLoginButton)

        //第三方登录容器
        let moreLogincontainer = TGLinearLayout(.horz)
        moreLogincontainer.tg_top.equal(PADDING_OUTER)
        moreLogincontainer.tg_width.equal(.fill)
        moreLogincontainer.tg_height.equal(.wrap)

        //间距平分，首尾没有间距
        moreLogincontainer.tg_gravity = TGGravity.horz.between
        container.addSubview(moreLogincontainer)

        //微信登录
        var moreButtonView = ViewFactoryUtil.buttonLarge(R.image.loginWechatSelected()!)
        moreButtonView.addTarget(self, action: #selector(onWechatClick(_:)), for: .touchUpInside)
        moreLogincontainer.addSubview(moreButtonView)

        //qq登录
        moreButtonView = ViewFactoryUtil.buttonLarge(R.image.loginQqSelected()!)
        moreButtonView.addTarget(self, action: #selector(onQQClick(_:)), for: .touchUpInside)
        moreLogincontainer.addSubview(moreButtonView)

        //微博登录
        moreButtonView = ViewFactoryUtil.buttonLarge(R.image.loginWeiboSelected()!)
        moreLogincontainer.addSubview(moreButtonView)

        //邮箱登录
        moreButtonView = ViewFactoryUtil.buttonLarge(R.image.loginNeteaseSelected()!)
        moreLogincontainer.addSubview(moreButtonView)

        //用户协议
        //这样实现的不好国际化
        let agreementString = NSMutableAttributedString(string: R.string.localizable.userAgreement())

        //设置字体
        agreementString.bs_font = UIFont.systemFont(ofSize: TEXT_SMALL)

        //设置文本颜色
        agreementString.bs_color = .black80

        var range = NSRange(location: 9, length: 4)
        agreementString.bs_set(textHighlightRange: range, color: .link, backgroundColor: nil) { containerView, text, range, rect in
            SuperWebController.start(self.navigationController!, uri: "http://www.ixuea.com/articles/4449")
        }

        agreementView.attributedText = agreementString
        container.addSubview(agreementView)
    }

    //用户协议view
    lazy var agreementView: BSLabel = {
        let r = BSLabel()
        r.tg_width.equal(.wrap)
        r.tg_height.equal(.wrap)
        r.textAlignment = .center
        r.numberOfLines = 0
        r.isUserInteractionEnabled = true
        return r
    }()

    @objc func onPhoneLoginClick(_ sender:QMUIButton) {}

    @objc func onUsernameClick(_ sender:QMUIButton) {
        startController(LoginController.self)
    }

    @objc func onWechatClick(_ sender:QMUIButton) {
    }

    @objc func onQQClick(_ sender:QMUIButton) {
    }

}
