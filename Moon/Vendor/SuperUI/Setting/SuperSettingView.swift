//
// Created by seaony on 2023/3/25.
//

import UIKit
import TangramKit

class SuperSettingView: TGLinearLayout {

    typealias ClickCallback = ((_ data: UIView)->Void)

    typealias SwitchChangedCallback = ((_ data: UISwitch)->Void)

    var click: ClickCallback?

    var switchChanged: SwitchChangedCallback?

    init() {
        super.init(frame: .zero, orientation: .horz)
        initViews()
        initListeners()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViews()
        initListeners()
    }

    func initViews(){
        tg_width.equal(.fill)
        tg_height.equal(55)
        tg_padding = UIEdgeInsets(top: 0, left: PADDING_OUTER, bottom: 0, right: PADDING_OUTER)
        tg_gravity = TGGravity.vert.center
        tg_space = PADDING_MEDDLE
        backgroundColor = .colorSurface

        addSubview(iconView)
        addSubview(titleView)
        addSubview(moreView)
        addSubview(moreIconView)
    }

    func initListeners(){
        isUserInteractionEnabled = true

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onClick(_:)))
        addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func onClick (_ data: UITapGestureRecognizer) {
        if let r = click {
            r(data.qmui_targetView!)
        }
        self.click?(self)
    }

    func small() {
        tg_padding = UIEdgeInsets(top: 0, left: PADDING_OUTER, bottom: 0, right: PADDING_OUTER)
        tg_height.equal(50)
    }


    func initSwitch() {
        insertSubview(superSwitch, at: 3)
        moreIconView.hide()
    }

    lazy var iconView: UIImageView = {
        let r = UIImageView()
        r.tg_width.equal(20)
        r.tg_height.equal(20)
        r.tintColor = .colorOnBackground
        r.hide()
        return r
    }()

    lazy var titleView: UILabel = {
        let result=UILabel()
        //fill:暂用剩下所有空间
        result.tg_width.equal(.fill)
        result.tg_height.equal(.wrap)
        result.font = UIFont.systemFont(ofSize: TEXT_LARGE)
        result.tintColor = .colorOnBackground
        return result
    }()

    lazy var moreView: UILabel = {
        let result=UILabel()
        result.tg_width.equal(.wrap)
        result.tg_height.equal(.wrap)
        result.font = UIFont.systemFont(ofSize: TEXT_SMALL)
        result.tintColor = .lightGray
        result.textColor = .lightGray
        return result
    }()

    lazy var moreIconView: UIImageView = {
        let result = ViewFactoryUtil.moreIconView()
        return result
    }()

    lazy var superSwitch: UISwitch = {
        let r = UISwitch()
        r.tg_width.equal(.wrap)
        r.tg_height.equal(.wrap)

        //开关状态为开的时候左侧颜色
        r.onTintColor = .colorPrimary

        r.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)

        return r
    }()

    @objc func switchChanged(_ sender:UISwitch) {
        if let r = switchChanged {
            r(sender)
        }
    }
}

extension SuperSettingView {

    static func smallWithIcon(_ icon: UIImage, title: String, click: @escaping ClickCallback, switchChanged: SwitchChangedCallback? = nil) -> SuperSettingView {
        let r = SuperSettingView()
        r.small()
        r.iconView.show()
        r.iconView.image = icon
        r.titleView.text = title
        r.click = click
        r.switchChanged = switchChanged

        if let _ = switchChanged {
            r.initSwitch()
        }

        return r
    }

}
