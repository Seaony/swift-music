//
//  BaseLogicController.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

//提供类似Android中更高层级布局框架
import TangramKit

class BaseLogicController: BaseCommonController {

    /// 根容器
    var rootContainer: TGBaseLayout!

    /// 头部容器&内容容器
    var superHeaderContainer: TGBaseLayout!
    var superHeaderContentContainer: TGBaseLayout!

    /// 内容容器
    var container: TGBaseLayout!

    var tableView: UITableView!

    /// 底部容器&内容容器
    var superFooterContainer: TGBaseLayout!
    var superFooterContentContainer: TGBaseLayout!

    // ScrollView 容器
    var scrollView: UIScrollView!

    // 内容容器，只有 ScrollView 时才有
    var contentContainer: TGBaseLayout!

    lazy var datum: [Any] = {

        var result: [Any] = []

        return result

    }()

    /// 初始化RelativeLayout容器，四边都在安全区内
    func initRelativeLayoutSafeArea() {

        initLinearLayout()

        //header
        initHeaderContainer()

        container = TGRelativeLayout()
        container.tg_width.equal(.fill)
        container.tg_height.equal(.fill)
        container.backgroundColor = .clear
        rootContainer.addSubview(container)

        initFooterContainer()

    }

    /// 初始化垂直方向 LinearLayout 容器，四边都在安全区内
    func initLinearLayoutSafeArea () {

        initLinearLayout()
        initHeaderContainer()

        container = TGLinearLayout(.vert)
        container.tg_width.equal(.fill)
        container.tg_height.equal(.fill)
        container.backgroundColor = .clear
        rootContainer.addSubview(container)

        initFooterContainer()
    }

    /// 初始化 TabeView，四边都在安全区内
    func initTableViewSafeArea () {

        initLinearLayoutSafeArea()

        // 创建 TableView
        createTableView()

        container.addSubview(tableView)
    }

    // 初始化 ScrollView 容器，四边都在安全区内
    func initScrollSafeArea () {

        initLinearLayoutSafeArea()

        // 创建 ScrollView
        scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.tg_width.equal(.fill)
        scrollView.tg_height.equal(.fill)
        container.addSubview(scrollView)

        // 真实内容容器
        contentContainer = TGLinearLayout(.vert)
        contentContainer.tg_width.equal(.fill)
        contentContainer.tg_height.equal(.wrap)

        scrollView.addSubview(contentContainer)
    }

    // 创建 TableView
    func createTableView () {

        tableView = ViewFactoryUtil.tableView()

        tableView.delegate = self
        tableView.dataSource = self

    }

    /// 使用默认分割线
    func initDefaultTableViewDivider() {
        tableView.separatorStyle = .singleLine
    }

    /// 初始化垂直方向 LinearLayout 容器
    func initLinearLayout () {

        rootContainer = TGLinearLayout(.vert)
        rootContainer.tg_width.equal(.fill)
        rootContainer.tg_height.equal(.fill)
        rootContainer.backgroundColor = .clear
        view.addSubview(rootContainer)

    }

    /// 初始化 Header 容器，在安全区外，一般用到设置头部到安全区的颜色
    func initHeaderContainer() {

        superHeaderContainer = TGLinearLayout(.vert)
        superHeaderContainer.tg_width.equal(.fill)
        superHeaderContainer.tg_height.equal(.wrap)
        superHeaderContainer.backgroundColor = .clear

        // 头部内容容器
        superHeaderContentContainer = TGLinearLayout(.vert)
        superHeaderContentContainer.tg_height.equal(.wrap)
        superHeaderContentContainer.tg_leading.equal(TGLayoutPos.tg_safeAreaMargin)
        superHeaderContentContainer.tg_trailing.equal(TGLayoutPos.tg_safeAreaMargin)
        superHeaderContentContainer.tg_top.equal(TGLayoutPos.tg_safeAreaMargin)
        superHeaderContentContainer.backgroundColor = .clear

        superHeaderContainer.addSubview(superHeaderContentContainer)
        rootContainer.addSubview(superHeaderContainer)

    }

    /// 初始化底部内容容器
    func initFooterContainer() {

        superFooterContainer = TGLinearLayout(.vert)
        superFooterContainer.tg_width.equal(.fill)
        superFooterContainer.tg_height.equal(.wrap)
        superFooterContainer.backgroundColor = .clear

        // 头部内容容器
        superFooterContentContainer = TGLinearLayout(.vert)
        superFooterContentContainer.tg_height.equal(.wrap)
        superFooterContentContainer.tg_leading.equal(TGLayoutPos.tg_safeAreaMargin)
        superFooterContentContainer.tg_trailing.equal(TGLayoutPos.tg_safeAreaMargin)
        superFooterContentContainer.tg_bottom.equal(TGLayoutPos.tg_safeAreaMargin)
        superFooterContentContainer.backgroundColor = .clear

        superFooterContainer.addSubview(superFooterContentContainer)
        rootContainer.addSubview(superFooterContainer)

    }

    override func initViews() {

        super.initViews()

        // 默认背景颜色
        setBackgroundColor(.colorBackground)

        // 隐藏导航栏
        navigationController?.navigationBar.isHidden = true
    }


    func finish() {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - 隐藏键盘

/// 点击空白隐藏键盘
    func initTapHideKeyboard() {
        //点击空白，关闭键盘
        let g=UITapGestureRecognizer(target: self, action: #selector(tapClick(_:)))

        //设置成false表示当前控件响应后会传播到其他控件上
        //如果不设置为false，界面里面的列表控件可能无法响应点击事件
        g.cancelsTouchesInView = true

        //将触摸事件添加到当前view
        view.addGestureRecognizer(g)
    }

    @objc func tapClick(_ data:UITapGestureRecognizer) {
        hideKeyboard()
    }

/// 隐藏键盘
    func hideKeyboard() {
        view.endEditing(true)
    }

}


extension BaseLogicController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return UITableViewCell()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return datum.count

    }




}
