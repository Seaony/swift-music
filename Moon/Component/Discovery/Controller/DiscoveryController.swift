//
//  DiscoveryController.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit

class DiscoveryController: BaseLogicController {

    override func initViews() {

        super.initViews()

        setBackgroundColor(.colorBackgroundLight)

        //初始化TableView结构
        initTableViewSafeArea()

        tableView.register(BannerCell.self, forCellReuseIdentifier: BannerCell.NAME)
        tableView.register(DiscoveryButtonCell.self, forCellReuseIdentifier: DiscoveryButtonCell.NAME)
        tableView.register(SheetGroupCell.self, forCellReuseIdentifier: SheetGroupCell.NAME)
        tableView.register(SongGroupCell.self, forCellReuseIdentifier: SongGroupCell.NAME)

    }

    override func initDatum() {
        super.initDatum()
        loadData()
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
                    self?.tableView.reloadData()
                }
                .disposed(by: rx.disposeBag)
    }

    func processAdClick(_ data: Ad) -> Void {

        print("广告点击 \(data.title!)")

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
        return .banner
    }

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
        print("歌单点击 \(data.title!)")
    }

}
