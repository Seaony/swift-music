//
//  DiscoveryController.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit
import SwiftEventBus

class DiscoveryController: BaseTitleController {

    override func initViews() {

        super.initViews()

        setBackgroundColor(.colorBackgroundLight)

        //初始化TableView结构
        initTableViewSafeArea()

        title = R.string.localizable.discovery()

        addLeftImageButton(R.image.menu()!)
        addRightImageButton(R.image.mic()!)

        toolbarView.addCenterItem(searchButton)

        tableView.register(BannerCell.self, forCellReuseIdentifier: BannerCell.NAME)
        tableView.register(DiscoveryButtonCell.self, forCellReuseIdentifier: DiscoveryButtonCell.NAME)
        tableView.register(SheetGroupCell.self, forCellReuseIdentifier: SheetGroupCell.NAME)
        tableView.register(SongGroupCell.self, forCellReuseIdentifier: SongGroupCell.NAME)
        tableView.register(DiscoveryFooterCell.self, forCellReuseIdentifier: DiscoveryFooterCell.NAME)

        //下拉刷新
        let header = MJRefreshNormalHeader {
            [weak self] in
            self?.loadData()
        }

        //隐藏标题
        header.stateLabel?.isHidden = true

        // 隐藏时间
        header.lastUpdatedTimeLabel?.isHidden = true
        tableView.mj_header = header
    }

    func startRefresh() {
        tableView.mj_header?.beginRefreshing()
    }

    // 停止从下拉刷新
    func endRefresh() {
        tableView.mj_header?.endRefreshing()
    }

    override func initDatum() {
        super.initDatum()
        // loadData()
        startRefresh()
    }

    func loadData() {
        DefaultRepository
                .shared
                .bannerAds()
                .subscribeSuccess { [weak self] data in
                    self?.datum.removeAll()
                    self?.datum.append(BannerData(data.data!.data!))
                    // 添加快捷按钮
                    self?.datum.append(ButtonData())
                    // 请求歌单
                    self?.loadSheetData()
                }
                .disposed(by: rx.disposeBag)
    }

    // 请求歌单
    func loadSheetData() {
        DefaultRepository
                .shared
                .sheets(size: VALUE12)
                .subscribeSuccess { [weak self] data in
                    self?.datum.append(SheetData(data.data!.data!))

                    // 请求单曲数据
                    self?.loadSongData()
                }
                .disposed(by: rx.disposeBag)
    }

    // 请求单曲数据
    func loadSongData() {
        DefaultRepository.shared.songs(size: VALUE12)
                .subscribeSuccess { [weak self] data in
                    self?.datum.append(SongData(data.data!.data!))
                    self?.datum.append(FooterData())
                    self?.tableView.reloadData()
                    self?.endRefresh()
                }
                .disposed(by: rx.disposeBag)
    }

    override func initListeners() {
        super.initListeners()

        SwiftEventBus.onMainThread(self, name: Constant.EVENT_SONG_CLICK) { [weak self] data in
            self?.precessSongClick(data?.object as! Song)
        }

        SwiftEventBus.onMainThread(self, name: Constant.CLICK_EVENT) { [weak self] data in
            self?.processClick(data?.object as! MyStyle)
        }
    }

    func processAdClick(_ data: Ad) -> Void {

        print("广告点击 \(data.title!)")

    }

    func precessSongClick(_ data: Song) -> Void {

        print("音乐点击 \(data.title!)")

    }

    func processClick(_ data: MyStyle) -> Void {
        switch data {
        case .refresh:
            autoRefresh()
        default:
            break
        }
    }

    // 滚动到顶部，再刷新
    func autoRefresh () {
        let indexPath = IndexPath(item: 0, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.startRefresh()
        }
    }

    // 根据数据获取 Cell 类型
    func typeForItemAtData(_ data: Any) -> MyStyle {
        if data is ButtonData {
            // banner
            return .button
        }
        if data is SheetData {
            // sheet
            return .sheet
        }
        if data is SongData {
            // sheet
            return .song
        }
        if data is FooterData {
            // sheet
            return .footer
        }
        return .banner
    }

    lazy var searchButton: QMUIButton = {
        let r = QMUIButton()
        r.tg_width.equal(SCREEN_WIDTH - 50 * 2)
        r.tg_height.equal(35)
        r.adjustsTitleTintColorAutomatically = true
        r.tintColor = .black80
        r.titleLabel?.font = UIFont.systemFont(ofSize: TEXT_MEDDLE)
        r.corner(17.5)
        r.setTitle(R.string.localizable.hintSearchValue(), for: .normal)
        r.setTitleColor(.black80, for: .normal)
        r.backgroundColor = .colorDivider
        r.setImage(R.image.search()!.withTintColor(), for: .normal)
        r.imagePosition = .left
        r.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: PADDING_SMALL)
        r.addTarget(self, action: #selector(searchClick(_:)), for: .touchUpInside)
        return r
    }()

    @objc func searchClick(_ sender: QMUIButton)  {}

}

extension DiscoveryController {

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = datum[indexPath.row]
        let type = typeForItemAtData(data)
        switch type {
        case .button:
            let cell = tableView.dequeueReusableCell(withIdentifier: DiscoveryButtonCell.NAME, for: indexPath) as! DiscoveryButtonCell
            cell.bind(data as! ButtonData)
            return cell
        case .sheet:
            let cell = tableView.dequeueReusableCell(withIdentifier: SheetGroupCell.NAME, for: indexPath) as! SheetGroupCell
            cell.bind(data as! SheetData)
            cell.delegate = self
            return cell
        case .song:
            let cell = tableView.dequeueReusableCell(withIdentifier: SongGroupCell.NAME, for: indexPath) as! SongGroupCell
            cell.bind(data as! SongData)
            return cell
        case .footer:
            let cell = tableView.dequeueReusableCell(withIdentifier: DiscoveryFooterCell.NAME, for: indexPath) as! DiscoveryFooterCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.NAME, for: indexPath) as! BannerCell
            cell.bind(data as! BannerData)
            cell.bannerClick = { [weak self] data in
                self?.processAdClick(data)
            }
            return cell
        }
    }
}

extension DiscoveryController: SheetGroupDelegate {

    /// 点击歌单
    func onSheetClick(_ data: Sheet) {
//        print("歌单点击 \(data.title!)")
        navigationController?.pushViewController(LoginHomeController(), animated: true)
    }

}
