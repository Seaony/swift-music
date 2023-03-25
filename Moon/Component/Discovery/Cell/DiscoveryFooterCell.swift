//
// Created by seaony on 2023/3/25.
//

import Foundation
import TangramKit
import SwiftEventBus

class DiscoveryFooterCell: BaseTableViewCell {

    static let NAME = "DiscoveryFooterCell"

    override func initViews() {
        super.initViews()

        container.tg_gravity = TGGravity.horz.center
        container.tg_padding = UIEdgeInsets(top: PADDING_MEDDLE, left: 0, bottom: PADDING_MEDDLE, right: 0)

        container.tg_space = PADDING_MEDDLE

        container.addSubview(orientationContainer)

        orientationContainer.addSubview(refreshView)

        // 提示wenben
        let infoView = UILabel()
        infoView.tg_width.equal(.wrap)
        infoView.tg_height.equal(.wrap)
        infoView.font = UIFont.systemFont(ofSize: 12)
        infoView.text = R.string.localizable.changeContent()
        infoView.textColor = .black80

        orientationContainer.addSubview(infoView)
        container.addSubview(customView)
    }

    @objc func refreshClick() {
        SwiftEventBus.post(Constant.CLICK_EVENT, sender: MyStyle.refresh)
    }

    override func getContainerOrientation() -> TGOrientation {
        return .vert
    }

    lazy var orientationContainer: TGLinearLayout = {
        let r = TGLinearLayout(.horz)
        r.tg_width.equal(.wrap)
        r.tg_height.equal(.wrap)
        r.tg_space = PADDING_MEDDLE
        r.tg_gravity = TGGravity.vert.center
        return r
    }()

    lazy var refreshView: QMUIButton = {

        let r = ViewFactoryUtil.linkButton()
        r.setTitle(R.string.localizable.clickRefresh(), for: .normal)
        r.setImage(R.image.refresh()!.withTintColor(), for: .normal)
        r.tintColor = .link
        r.setTitleColor(.link, for: .normal)
        r.addTarget(self, action: #selector(refreshClick), for: .touchUpInside)
        r.titleLabel?.font = UIFont.systemFont(ofSize: TEXT_SMALL)
        r.sizeToFit()

        return r

    }()

    lazy var customView: QMUIButton = {

        let r = ViewFactoryUtil.secondHalfFilletSmallButton()
        r.setTitle(R.string.localizable.customDiscovery(), for: .normal)
        return r

    }()

}
