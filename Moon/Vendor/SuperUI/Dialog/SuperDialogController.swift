//
// Created by seaony on 2023/3/26.
//

import Foundation
import TangramKit

class SuperDialogController: BaseController, QMUIModalPresentationContentViewControllerProtocol {

    var contentContainer: TGBaseLayout!

    var footerContainer: TGBaseLayout!

    var modalController: QMUIModalPresentationViewController!

    var buttons: Array<UIView> = []

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
        contentContainer.tg_space = 0.5
//        contentContainer.backgroundColor = .colorBackground
//        contentContainer.tg_padding = UIEdgeInsets(top: PADDING_OUTER, left: PADDING_OUTER, bottom: PADDING_OUTER, right: PADDING_OUTER)
        contentContainer.tg_gravity = TGGravity.horz.center
        view.addSubview(contentContainer)

        // 标题
        contentContainer.addSubview(titleView)

        // 底部容器
        footerContainer = TGLinearLayout(.horz)
        footerContainer.tg_space = PADDING_MIN
        footerContainer.tg_width.equal(.fill)
        footerContainer.tg_height.equal(.wrap)
        contentContainer.addSubview(footerContainer)

        footerContainer.addSubviews(buttons)
    }

    /// 标题
    lazy var titleView: UILabel = {
        let r = QMUILabel()
        r.tg_width.equal(.fill)
        r.tg_height.equal(.wrap)
        r.text = "标题"
        r.textColor = .colorOnSurface
        r.font = UIFont.boldSystemFont(ofSize: TEXT_LARGE2)
        r.textAlignment = .center
        r.backgroundColor = .colorBackground
        r.contentEdgeInsets = UIEdgeInsets(top: PADDING_LARGE2, left: PADDING_OUTER, bottom: PADDING_LARGE2, right: PADDING_OUTER)
        return r
    }()

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

    // 设置取消按钮
    @discardableResult
    func setCancelButton(title: String, target: Any? = nil, action: Selector? = nil) -> SuperDialogController {
        addButton(title: title, color: .colorOnSurface, target: target, action: action)
    }

    // 设置警告按钮
    @discardableResult
    func setWarningButton(title: String, target: Any? = nil, action: Selector? = nil) -> SuperDialogController {
        addButton(title: title, color: .warning, target: target, action: action)
    }

    // 设置确认按钮
    @discardableResult
    func setConfirmButton(title: String, target: Any? = nil, action: Selector? = nil) -> SuperDialogController {
        addButton(title: title, color: .primaryColor, target: target, action: action)
    }

    @discardableResult
    func addButton(title: String, color: UIColor, target: Any? = nil, action: Selector? = nil) -> SuperDialogController {
        let r = ViewFactoryUtil.button(title: title, color: color)
        if let action = action {
            r.addTarget(target, action: action, for: .touchUpInside)
        } else {
            r.addTarget(self, action: #selector(cancelClick(_:)), for: .touchUpInside)
        }
        r.tg_width.equal(.fill)
        r.tg_height.equal(BUTTON_LARGE)

        return add(r)
    }

    func add(_ data: UIView) -> SuperDialogController {
        buttons.append(data)
        return self
    }

    @objc func cancelClick(_ sender: QMUIButton) {
        hide()
    }

    func setTitleText(_ data: String) {
        titleView.text = data
    }
}
