//
//  BannerCell.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit

class BannerCell: BaseTableViewCell {
    
    static let NAME = "BannerCell"
    
    var bannerView: YJBannerView!
    
    var data: BannerData!
    
    var datum: [String] = []
    
    var bannerClick: ((Ad) -> Void)!
    
    
    override func initViews() {
        
        super.initViews()
        
        //底部的距离，由下一个控件设置，除非不方便设置
        self.container.tg_padding = UIEdgeInsets(top: PADDING_OUTER, left: PADDING_OUTER, bottom: 0, right: PADDING_OUTER)
        
        // 轮播图
        bannerView = YJBannerView()
        bannerView.backgroundColor = .clear
        bannerView.dataSource = self
        bannerView.delegate = self
        bannerView.tg_width.equal(.fill)
        
        //SCREEN_WIDTH是QMUI提供的宏
        //直接在initViews里面这样获取self.contentView.frame.size.width是默认值
        //而不是应用了自动布局后的值
        bannerView.tg_height.equal(UIScreen.main.bounds.width * 0.389)
        
        bannerView.clipsToBounds = true
        bannerView.layer.cornerRadius = 10
        
        //设置如果找不到图片显示的图片
        bannerView.emptyImage=R.image.placeholder()
        
        //设置占位图
        bannerView.placeholderImage=R.image.placeholder()
        
        //设置轮播图内部显示图片的时候调用什么方法
        bannerView.bannerViewSelectorString="sd_setImageWithURL:placeholderImage:"
        
        //设置指示器默认颜色
        bannerView.pageControlNormalColor = .black80
        
        //高亮的颜色
        bannerView.pageControlHighlightColor = .colorPrimary
        

        container.addSubview(bannerView)
        
    }
    
    /// 绑定数据
    func bind(_ data: BannerData) {
        
        self.data = data
        
        // 清空原来的数据
        datum.removeAll()
        
        // 循环每个广告
        // 取出广告地址
        // 放到数组中
        for it in data.data {
            
            datum.append(ResourceUtil.resourceUri(it.icon))
            
        }
        
        bannerView.reloadData()
        
    }
}

extension BannerCell: YJBannerViewDataSource, YJBannerViewDelegate {
    
    func bannerViewImages(_ bannerView: YJBannerView!) -> [Any]! {
        
        return datum
        
    }
    
    // 缩放
    func bannerView(_ bannerView: YJBannerView!, customCell: UICollectionViewCell!, index: Int) -> UICollectionViewCell! {
        
        let cell = customCell as! YJBannerViewCell
        
        cell.showImageViewContentMode = .scaleAspectFill
        
        return cell
        
    }
    
    // Banner 点击回调方法
    func bannerView(_ bannerView: YJBannerView!, didSelectItemAt index: Int) {
        
        let r = data.data[index]
        
        bannerClick(r)
        
    }
    
}
