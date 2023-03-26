//
//  DiscoveryController.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit
import SwiftEventBus

class BaseMainController: BaseTitleController {

    lazy var searchButton: QMUIButton = {
        let r = QMUIButton()
        r.tg_width.equal(SCREEN_WIDTH - 50 * 2)
        r.tg_height.equal(35)
        r.adjustsTitleTintColorAutomatically = true
        r.tintColor = .black80
        r.titleLabel?.font = UIFont.systemFont(ofSize: TEXT_MEDDLE)
        r.corner(17.5)
        r.setTitle(R.string.localizable.hintSearchValue(), for: .normal)
        r.setTitleColor(.black80, for: .normal)
        r.backgroundColor = .colorDivider
        r.setImage(R.image.search()!.withTintColor(), for: .normal)
        r.imagePosition = .left
        r.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: PADDING_SMALL)
        r.addTarget(self, action: #selector(searchClick(_:)), for: .touchUpInside)
        return r
    }()

    @objc func searchClick(_ sender: QMUIButton)  {}

    override func initViews() {
        super.initViews()
        setBackgroundColor(.colorBackgroundLight)
        addLeftImageButton(R.image.menu()!)
        addRightImageButton(R.image.mic()!)
        toolbarView.addCenterItem(searchButton)
    }

    override func initListeners() {
        super.initListeners()
        self.cw_registerShowIntractive(withEdgeGesture: false) { [weak self] direction in
            if direction == .fromLeft {
                self?.openDrawer()
            }
        }
    }

    override func leftClick(_ sender: QMUIButton) {
        openDrawer()
    }

    func closeDrawer() {
        dismiss(animated: true, completion: nil)
    }

    func openDrawer () {
        //真实内容滑动到外面
        // self.cw_showDefaultDrawerViewController(drawerController)


        //侧滑显示到真实内容上面
        self.cw_showDrawerViewController(drawerController, animationType: .mask, configuration: nil)
    }

    lazy var drawerController: DrawerController = {
        let r = DrawerController()
        return r
    }()
}
