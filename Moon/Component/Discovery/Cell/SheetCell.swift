//
// Created by seaony on 2023/3/24.
//

import UIKit
import TangramKit

class SheetCell: BaseCollectionViewCell {

    static let NAME = "SheetCell"

    override func initViews() {
        super.initViews()

        container.tg_space = PADDING_SMALL

        container.addSubview(iconView)
        container.addSubview(titleView)
    }

    lazy var iconView: UIImageView = {
        let r = UIImageView()
        r.tg_width.equal(.fill)
        r.tg_height.equal(r.tg_width)
        r.image = R.image.placeholder()
        r.clipsToBounds = true
        r.contentMode = .scaleAspectFill
        r.smallCorner()
        return r
    }()

    /// 标题 View
    lazy var titleView: UILabel = {
        let r = UILabel()
        r.tg_width.equal(.fill)
        r.tg_height.equal(.wrap)
        r.font = UIFont.systemFont(ofSize: TEXT_MEDDLE)
        r.textColor = .colorOnSurface
        r.numberOfLines = 2
        return r
    }()

    /// 绑定数据
    ///
    /// - Parameter data: 数据
    func bind(_ data: Sheet) {
        // 使用 SDWebImage 显示图片
        // if let r = data.icon {
        //    let r = ResourceUtil.resourceUri(r)
        //    iconView.sd_setImage(with: URL(string: r), placeholderImage: R.image.placeholder())
        // }

        // 使用自己写的拓展方法显示图片
        iconView.show(data.icon)

        // 设置标题
        titleView.text = data.title
    }
}
