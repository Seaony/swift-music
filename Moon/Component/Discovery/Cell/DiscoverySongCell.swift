//
// Created by seaony on 2023/3/25.
//

import UIKit
import TangramKit

class DiscoverySongCell: BaseTableViewCell {

    /// 定义名称，注册的时候用
    static let NAME = "DiscoverySongCell"

    override func initViews() {
        super.initViews()
        container.tg_space = PADDING_OUTER
        container.tg_gravity = TGGravity.vert.center

        container.addSubview(iconView)
        container.addSubview(metaView)

        metaView.addSubview(titleView)
        metaView.addSubview(subtitleView)
    }

    func bind (_ data: Song) {

        iconView.sd_setImage(with: URL(string: data.icon!.absoluteUri()), placeholderImage: R.image.placeholder())
//        iconView.show(data.icon)
        titleView.text = data.title
        subtitleView.text = "\(data.singer.nickname!) - 《七月的肖邦》"

    }

    // 歌曲的封面
    lazy var iconView: UIImageView = {

        let result = UIImageView()
        result.tg_width.equal(51)
        result.tg_height.equal(51)
        result.image = R.image.dayRecommend()
        result.clipsToBounds = true
        result.contentMode = .scaleAspectFill
        result.smallCorner()
        return result

    }()

    // 右侧的信息
    lazy var metaView: TGLinearLayout = {

        let result = TGLinearLayout(.vert)
        result.tg_width.equal(.fill)
        result.tg_height.equal(.wrap)
        result.tg_space = PADDING_SMALL
        return result

    }()

    lazy var titleView: UILabel = {

        let result = UILabel()
        result.tg_width.equal(.fill)
        result.tg_height.equal(.wrap)
        result.text = "歌曲名称"
        result.numberOfLines = 2
        result.font = UIFont.systemFont(ofSize: 14)
        result.textColor = .colorOnSurface
        return result

    }()


    lazy var subtitleView: UILabel = {

        let result = UILabel()
        result.tg_width.equal(.fill)
        result.tg_height.equal(.wrap)
        result.text = "歌曲名称"
        result.font = UIFont.systemFont(ofSize: 12)
        result.textColor = .black80
        return result

    }()

}
