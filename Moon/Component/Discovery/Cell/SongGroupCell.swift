//
// Created by seaony on 2023/3/25.
// 单曲组 Cell

import Foundation
import TangramKit

class SongGroupCell: BaseTableViewCell {

    /// 这个组件注册时的名称
    static let NAME = "SongGroupCell"

    override func initViews() {
        super.initViews()
        // 分割线
        container.addSubview(ViewFactoryUtil.smallDivider())
        // 标题
        container.addSubview(titleView)
    }

    func bind(_ data: SongData) {}

    /// 获取 Container 的方向
    override func getContainerOrientation() -> TGOrientation {
        return .vert
    }

    lazy var titleView: ItemTitleView = {

        let r = ItemTitleView()
        r.titleView.text = R.string.localizable.recommendSong()
        return r

    }()

}
