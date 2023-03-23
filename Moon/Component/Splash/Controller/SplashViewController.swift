//
//  SplashViewController.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit
import TangramKit

class SplashViewController: BaseLogicController {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        self.initRelativeLayoutSafeArea()
        
        // let container = TGRelativeLayout()
        // container.tg_top.equal(TGLayoutPos.tg_safeAreaMargin)
        // container.tg_leading.equal(TGLayoutPos.tg_safeAreaMargin)
        // container.tg_trailing.equal(TGLayoutPos.tg_safeAreaMargin)
        // container.tg_bottom.equal(TGLayoutPos.tg_safeAreaMargin)
        // view.addSubview(container)
        
        
        // MARK: Banner
        let bannerView = UIImageView()
        bannerView.tg_width.equal(75)
        bannerView.tg_height.equal(309)
        bannerView.tg_top.equal(120)
        bannerView.tg_centerX.equal(0)
        bannerView.image = R.image.splashBanner()
        container.addSubview(bannerView)
        
        // MARK: Copyright
        let copyrightView = UILabel()
        
        copyrightView.font = UIFont.systemFont(ofSize: 12)
        copyrightView.textColor = .secondaryLabel
        
        let year = SuperDateUtil.currentYear()
        
        copyrightView.text = String(format: "Developed By Seaony %d, Powered By Swift", year)
        // copyrightView.text = R.string.localizable.clickReload("网络错误")
        
        copyrightView.tg_width.equal(.wrap)
        copyrightView.tg_height.equal(.wrap)
        copyrightView.tg_bottom.equal(16)
        copyrightView.tg_centerX.equal(0)
        container.addSubview(copyrightView)
        
        // MARK: Logo
        let logoView = UIImageView(image: R.image.splashLogo())
        logoView.tg_width.equal(188)
        logoView.tg_height.equal(31)
        logoView.tg_bottom.equal(copyrightView.tg_top).offset(16)
        logoView.tg_centerX.equal(0)
        logoView.contentMode = .scaleAspectFit
        container.addSubview(logoView)
        
        // 用户协议
        
    }
    
    /// 显示服务条款对话框
    override func initDatum() {
        
        super.initDatum()
        
        if DefaultPreferenceUtil.isAcceptTermsServiceAgreement() {
            
            // 如果已经同意了
            prepareNext()
            
        } else {
            
            showTermsServiceAgreementDialog()
            
        }
        
    }
    
    func prepareNext () {
        
        // 延时
        // perform(<#T##aSelector: Selector##Selector#>, with: <#T##Any?#>, afterDelay: <#T##TimeInterval#>)
        
        next()
        
    }
    
    func next () {
        
        AppDelegate.shared.toGuide()
        
    }
    
    func showTermsServiceAgreementDialog() {
        
        dialogController.show()
        
    }
    
    lazy var dialogController: TermServiceDialogController = {
        
        let r = TermServiceDialogController()
        
        r.titleView.text = R.string.localizable.termServicePrivacy()
        r.primaryButton.addTarget(self, action: #selector(agreeClick(_:)), for: .touchUpInside)
        
        return r
        
    }()
    
    /// 用户点击同意
    @objc func agreeClick (_ sender: QMUIButton) {
        
        dialogController.hide()
        
        DefaultPreferenceUtil.setAcceptTermsServiceAgreement(true)
        
        
        AppDelegate.shared.toGuide()
        
    }
    

}
