//
// Created by seaony on 2023/3/25.
//

import Foundation
import TangramKit

class SuperToolbarView: TGRelativeLayout {

    init() {
        super.init(frame: .zero)
        initViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }

    func initViews() {
        tg_width.equal(.fill)
        tg_height.equal(50)

        // 左/右侧容器
        addSubview(leftContainer)

        addSubview(centerContainer)
        centerContainer.addSubview(titleView)

        addSubview(rightContainer)
    }

    @discardableResult
    func addLeftItem(_ data:UIView) -> SuperToolbarView {
        leftContainer.addSubview(data)
        return self
    }

    @discardableResult
    func addRightItem(_ data:UIView) -> SuperToolbarView {
        rightContainer.addSubview(data)
        return self
    }

    @discardableResult
    func addCenterItem(_ data:UIView) -> SuperToolbarView {
        titleView.hide()
        centerContainer.addSubview(data)
        return self
    }

    lazy var centerContainer: TGLinearLayout = {
        let r = TGLinearLayout(.horz)
        r.tg_width.equal(.wrap)
        r.tg_height.equal(.fill)
        r.tg_gravity = TGGravity.vert.center
        r.tg_centerX.equal(0)
        r.tg_centerY.equal(0)
        return r
    }()

    lazy var titleView: UILabel = {
        let r = UILabel()
        r.tg_width.equal(SCREEN_WIDTH - 150)
        r.tg_height.equal(.wrap)
        r.numberOfLines = 1
        r.font = UIFont.systemFont(ofSize: TEXT_LARGE3, weight: .heavy)
        r.textColor = .colorOnSurface
        return r
    }()

    lazy var leftContainer: TGLinearLayout = {
        let r = TGLinearLayout(.horz)
        r.tg_space = PADDING_SMALL
        r.tg_gravity = TGGravity.vert.center
        r.tg_leading.equal(12)
        r.tg_trailing.equal(centerContainer.tg_leading).offset(PADDING_MEDDLE)
        r.tg_height.equal(.fill)
        return r
    }()

    lazy var rightContainer: TGLinearLayout = {
        let r = TGLinearLayout(.horz)
        r.tg_space = PADDING_SMALL
        r.tg_gravity = [TGGravity.vert.center, TGGravity.horz.right]
        r.tg_trailing.equal(12)
        r.tg_leading.equal(centerContainer.tg_trailing).offset(PADDING_MEDDLE)
        r.tg_height.equal(.fill)
        return r
    }()
}
