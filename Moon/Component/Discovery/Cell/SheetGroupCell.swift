//
//  SheetGroupCell.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit
import TangramKit

protocol SheetGroupDelegate: NSObjectProtocol {

    /// 点击歌单
    func onSheetClick(_ data: Sheet)

}

class SheetGroupCell: BaseTableViewCell {

    /// Cell 的名称
    static let NAME = "SheetGroupCell"

    /// 歌单数据
    var datum: [Sheet] = []

    /// 每个 Cell 的宽度
    var cellWidth: CGFloat!

    /// 每个 Cell 的高度
    var cellHeight: CGFloat!

    /// 每行显示的个数
    var spanCount: CGFloat = 3

    /// 代理的协议
    weak open var delegate: SheetGroupDelegate?

    override func initViews() {

        super.initViews()
        // 分割线
        container.addSubview(ViewFactoryUtil.smallDivider())
        // 标题
        container.addSubview(titleView)
        // 歌单
        container.addSubview(collectionView)
        collectionView.register(SheetCell.self, forCellWithReuseIdentifier: SheetCell.NAME)
    }

    /// 获取 Container 的方向
    override func getContainerOrientation() -> TGOrientation {
        return .vert
    }

    func bind(_ data: SheetData) {
        // 计算每个 Cell 的宽度
        // 屏幕宽度-外边距(16*2)-(self.spanCOunt-1)*5
        cellWidth = (SCREEN_WIDTH - PADDING_OUTER * CGFloat(2) - (spanCount - CGFloat(1)) * PADDING_SMALL) / spanCount

        cellHeight = cellWidth + PADDING_SMALL + 40

        // 计算可以显示多少行
        let rows = ceil(CGFloat(data.datum.count) / spanCount)

        // CollectionView 高度等于，行数*行高，10：垂直方向每个间距
        let viewHeight = rows * (cellHeight + PADDING_MEDDLE)

        collectionView.tg_height.equal(viewHeight)


        datum.removeAll()
        datum += data.datum
        collectionView.reloadData()
    }

    /// 点击歌单
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = datum[indexPath.row]
        delegate?.onSheetClick(data)
        // 被点击后需要轻微振动一下
        // UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
    }

    lazy var titleView: ItemTitleView = {

        let r = ItemTitleView()
        r.titleView.text = R.string.localizable.recommendSheet()
        return r

    }()

    lazy var collectionView: UICollectionView = {

        let r = ViewFactoryUtil.collectionView()
        r.delegate = self
        r.dataSource = self
        r.isScrollEnabled = false
        return r

    }()
}

extension SheetGroupCell: UICollectionViewDelegate, UICollectionViewDataSource {

    //
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datum.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = datum[indexPath.row]

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SheetCell.NAME, for: indexPath) as! SheetCell

        cell.bind(data)

        return cell
    }
}

extension SheetGroupCell: UICollectionViewDelegateFlowLayout {

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: cellWidth, height: cellHeight)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return PADDING_MEDDLE
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return PADDING_SMALL
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: PADDING_OUTER, bottom: PADDING_OUTER, right: PADDING_OUTER)
        }
}
