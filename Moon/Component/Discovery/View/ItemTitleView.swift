//
//  ItemTitleView.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit
import TangramKit

class ItemTitleView: TGRelativeLayout {


    init() {
        super.init(frame: CGRect.zero)
        initViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }

    func initViews() {
        tg_width.equal(.fill)
        tg_height.equal(.wrap)
        tg_padding = UIEdgeInsets(top: PADDING_MEDDLE, left: PADDING_OUTER, bottom: PADDING_MEDDLE, right: PADDING_OUTER)
        addSubview(titleView)
        addSubview(moreIconView)
    }

    lazy var titleView: UILabel = {

        let r = UILabel()
        r.tg_width.equal(.wrap)
        r.tg_height.equal(.wrap)
        r.tg_centerY.equal(0)
        r.numberOfLines = 1
        r.font = UIFont.systemFont(ofSize: TEXT_LARGE2, weight: .heavy)
        r.textColor = .colorOnSurface
        return r

    }()

    lazy var moreIconView: UIImageView = {
        let r = UIImageView()
        r.tg_width.equal(15)
        r.tg_height.equal(15)
        r.image = R.image.superChevronRight()?.withTintColor()
        r.tintColor = .red
        r.tg_centerY.equal(0)
        r.tg_right.equal(0)
        r.contentMode = .scaleAspectFit
        return r
    }()

}
