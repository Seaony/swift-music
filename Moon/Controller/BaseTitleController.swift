//
//  BaseTitleController.swift
//  通用标题控制器
//
//  Created by seaony on 2023/3/24.
//

import UIKit

class BaseTitleController: BaseLogicController {

    override func initLinearLayoutSafeArea() {
        super.initLinearLayoutSafeArea()
        if isAddToolBar() {
            initToolbar()
        }
    }

    override var title: String? {
        didSet {
            if let title = title {
                toolbarView.titleView.text = title
            }
        }
    }

    func isAddToolBar() -> Bool {
        return true
    }

    func initToolbar() {
        superHeaderContentContainer.addSubview(toolbarView)

        // 添加返回按钮
        if navigationController?.viewControllers.count != 1 {
            let r = addLeftImageButton(R.image.arrowLeft()!.withTintColor())
            r.tag = VALUE10
        }
    }

    @discardableResult
    // 添加左侧图标按钮
    func addLeftImageButton(_ data: UIImage) -> QMUIButton {
        let btn = ViewFactoryUtil.button(data)
        btn.addTarget(self, action: #selector(leftClick(_:)), for: .touchUpInside)
        toolbarView.addLeftItem(btn)
        return btn
    }

    func addRightImageButton(_ data: UIImage) {
        let btn = ViewFactoryUtil.button(data)
        btn.addTarget(self, action: #selector(rightClick(_:)), for: .touchUpInside)
        toolbarView.addRightItem(btn)
    }

    func addRightButton(_ data: String) {
        let btn = ViewFactoryUtil.linkButton()
        btn.setTitle(data, for: .normal)
        btn.setTitleColor(.colorOnSurface, for: .normal)
        btn.addTarget(self, action: #selector(rightClick(_:)), for: .touchUpInside)
        btn.sizeToFit()
        toolbarView.addRightItem(btn)
    }

    @objc func leftClick(_ sender: QMUIButton) {
        if sender.tag == VALUE10 {
            navigationController?.popViewController(animated: true)
        }
    }

    @objc func rightClick(_ sender: QMUIButton) {
    }

    lazy var toolbarView: SuperToolbarView = {
        let view = SuperToolbarView()
        return view
    }()

}
