//
// Created by seaony on 2023/3/25.
// 单曲组 Cell

import Foundation
import TangramKit
import SwiftEventBus

class SongGroupCell: BaseTableViewCell {

    /// 这个组件注册时的名称
    static let NAME = "SongGroupCell"

    var data: SongData!

    static let HEIGHT_DISCOVERY_SONG: CGFloat = 51 + 10 * 2

    override func initViews() {
        super.initViews()
        // 分割线
        container.addSubview(ViewFactoryUtil.smallDivider())
        // 标题
        container.addSubview(titleView)

        container.addSubview(tableView)
    }

    func bind(_ data: SongData) {
        self.data = data

        // 高度等于内容高度
        let viewHeight = CGFloat(data.datum.count) * SongGroupCell.HEIGHT_DISCOVERY_SONG
        tableView.tg_height.equal(viewHeight)

        tableView.reloadData()
    }

    /// 获取 Container 的方向
    override func getContainerOrientation() -> TGOrientation {
        return .vert
    }

    lazy var titleView: ItemTitleView = {

        let r = ItemTitleView()
        r.titleView.text = R.string.localizable.recommendSong()
        return r

    }()

    lazy var tableView: UITableView = {

        let r = ViewFactoryUtil.tableView()
        r.separatorStyle = .singleLine
        r.bounces = false

        // 分割线颜色
        r.separatorColor = .colorDivider
        r.delegate = self
        r.dataSource = self

        // 注册 Cell
        r.register(DiscoverySongCell.self, forCellReuseIdentifier: DiscoverySongCell.NAME)

        return r

    }()

}

extension SongGroupCell: QMUITableViewDelegate, QMUITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.datum.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverySongCell.NAME, for: indexPath) as! DiscoverySongCell
        // 第一行，不要到顶部边距
        cell.container.tg_padding = UIEdgeInsets(top: PADDING_MEDDLE, left: PADDING_OUTER, bottom: PADDING_MEDDLE, right: PADDING_OUTER)
        cell.bind(data.datum[indexPath.row])
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SwiftEventBus.post(Constant.EVENT_SONG_CLICK, sender: data.datum[indexPath.row])
    }
}
