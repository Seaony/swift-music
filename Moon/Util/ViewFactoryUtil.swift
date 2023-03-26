//
//  ViewFactoryUtil.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit
import TangramKit
import Foundation

class ViewFactoryUtil {

    /// 创建一个主色调小圆角按钮
    static func primaryButton() -> QMUIButton {

        let r = QMUIButton()

        // 当用户按下后标题是否根据用户设置的 Tint Color 变色
        r.adjustsTitleTintColorAutomatically = false

        // 按下后高亮颜色是否自动调整
        r.adjustsButtonWhenHighlighted = true

        // 文字大小
        r.titleLabel?.font = UIFont.systemFont(ofSize: TEXT_LARGE)

        // 宽高
        r.tg_width.equal(.fill)
        r.tg_height.equal(BUTTON_MEDDLE)

        r.backgroundColor = .colorPrimary
        r.layer.cornerRadius = SMALL_RADIUS
        r.tintColor = .colorLightWhite

        // 标题颜色
        r.setTitleColor(.colorLightWhite, for: .normal)

        return r

    }

    /// 定义一个主色调半圆角按钮
    static func primaryHalfFilletButton() -> QMUIButton {

        let r = self.primaryButton()

        r.layer.cornerRadius = BUTTON_MEDDLE_RADIUS

        return r

    }


    /// 主色调文本,小圆角按钮,灰色边框
    /// - Returns: <#description#>
    static func primaryOutlineButton() -> QMUIButton {
        let r = primaryButton()
        r.layer.cornerRadius = SMALL_RADIUS

        r.tintColor = .black130
        r.layer.borderWidth = 1
        r.layer.borderColor = UIColor.black130.cgColor
        r.backgroundColor = .clear
        r.setTitleColor(.colorPrimary, for: .normal)
        return r
    }

    /// 链接按钮
    static func linkButton() -> QMUIButton {

        let r = QMUIButton()

        r.adjustsTitleTintColorAutomatically = false
        r.titleLabel?.font = UIFont.systemFont(ofSize: TEXT_MEDDLE)

        return r

    }

    static func secondHalfFilletSmallButton () -> QMUIButton {

        let r = QMUIButton()
        r.titleLabel?.font = UIFont.systemFont(ofSize: TEXT_SMALL)
        r.tg_width.equal(90)
        r.tg_height.equal(BUTTON_SMALL)
        r.tintColor = .black80
        r.border(.black80)
        r.corner(BUTTON_SMALL_RADIUS)
        r.setTitleColor(.black80, for: .normal)
        return r

    }

    static func primaryHalfFilletOutlineButton () -> QMUIButton {
        let r = primaryOutlineButton()
        r.layer.cornerRadius = BUTTON_MEDDLE_RADIUS
        return r
    }

    static func buttonLarge(_ data: UIImage) -> QMUIButton {
        let r = button(data)
        r.tg_width.equal(40)
        r.tg_height.equal(40)
        return r
    }

    static func button (_ image: UIImage) -> QMUIButton {
        let r = QMUIButton()
        r.adjustsTitleTintColorAutomatically = true
        r.tg_width.equal(30)
        r.tg_height.equal(30)
        r.tintColor = .colorOnSurface
        r.setImage(image, for: .normal)
        return r
    }

    /// 创建 UITableView
    static func tableView() -> UITableView {

        let r = UITableView()

        r.backgroundColor = .clear

        // 去掉没有数据 Cell 的分割线
        r.tableFooterView = UIView()

        // 去掉默认分割线
        r.separatorStyle = .none

        // 修复分割线右侧便宜
        r.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        r.tg_width.equal(.fill)
        r.tg_height.equal(.fill)

        // 设置自动高度
        r.rowHeight = UITableView.automaticDimension
        r.estimatedRowHeight = UITableView.automaticDimension

        // 隐藏滚动条
        r.showsVerticalScrollIndicator = false

        // 设置可以选择
        r.allowsSelection = true

        return r

    }

    // 创建小的水平分割线
    static func smallDivider() -> UIView {

        let r = UIView()
        r.tg_width.equal(.fill)
        r.tg_height.equal(0.5)
        r.backgroundColor = .colorDivider
        return r

    }

    static func collectionView() -> UICollectionView {
        // 这里的布局参数可以不用传,因为在 UICollectionView 中已经有默认的布局参数
        let r = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout())

        r.backgroundColor = .clear

        // 隐藏滚动条
        r.showsHorizontalScrollIndicator = false
        r.showsVerticalScrollIndicator = false

        // 内容从顶部距离开始展示，不要偏移状态栏尺寸
        r.contentInsetAdjustmentBehavior = .never

        r.tg_width.equal(.fill)
        r.tg_height.equal(.fill)

        return r
    }

    static func collectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let r = UICollectionViewFlowLayout()
        // 设置内边距
        r.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        // 可以滚动的方向
        r.scrollDirection = .vertical
        // 每个Cell的行间距
        r.minimumLineSpacing = 0
        // 每个Cell的列间距
        r.minimumInteritemSpacing = 0
        return r
    }

    static func moreIconView() -> UIImageView {
        let r = UIImageView()
        r.tg_width.equal(15)
        r.tg_height.equal(15)
        r.image = R.image.superChevronRight()?.withTintColor()
        r.tintColor = .black80
        r.tg_centerY.equal(0)
        r.contentMode = .scaleAspectFit
        return r
    }

    static func orientationContainer(_ orientation:TGOrientation = .horz) -> TGLinearLayout {
        let result = TGLinearLayout(orientation)
        result.tg_width.equal(.fill)
        result.tg_height.equal(.wrap)

        return result
    }
}
