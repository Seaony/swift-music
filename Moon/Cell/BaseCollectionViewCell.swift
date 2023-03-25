//
//  BaseTableViewCell.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit
import TangramKit

class BaseCollectionViewCell: UICollectionViewCell {

    var container: TGBaseLayout!

    override init(frame: CGRect) {
        super.init(frame: frame)
        innerInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        innerInit()
    }

    func innerInit() {
        initViews()
        initDatum()
        initListeners()
    }

    func initViews() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        // 根容器
        container = TGLinearLayout(getContainerOrientation())
        container.tg_width.equal(.fill)
        container.tg_height.equal(.wrap)
        container.tg_space = PADDING_MEDDLE
        contentView.addSubview(container)
    }

    func initDatum() {

    }

    func initListeners() {

    }

    func getContainerOrientation () -> TGOrientation {
        return .vert
    }

    // 自动计算高度
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return self.container.systemLayoutSizeFitting(targetSize)
    }

}
