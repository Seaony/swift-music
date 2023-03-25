//
//  BaseTableViewCell.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit
import TangramKit

class BaseTableViewCell: UITableViewCell {


    var container: TGBaseLayout!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        innerInit()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        innerInit()
    }

    func innerInit() {

        initViews()
        initDatum()
        initListeners()

    }

    func initViews() {

        // 背景透明
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        // 去掉选中的颜色
        selectionStyle = .none

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
        return .horz
    }

    // 自动计算高度
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return self.container.systemLayoutSizeFitting(targetSize)
    }

}
