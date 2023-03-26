//
// Created by seaony on 2023/3/25.
//

import WebKit
import UIKit
import TangramKit

class SuperWebController: BaseTitleController {
    var uri: String?
    var content: String?

    override func initViews() {
        super.initViews()
        initRelativeLayoutSafeArea()

        addRightImageButton(R.image.close()!.withTintColor())
        container.addSubview(webView)
        container.addSubview(progressView)
    }

    override func initDatum() {
        super.initDatum()

        if SuperStringUtil.isNotBlank(uri) {
            // 显示网址
            let request = URLRequest(url: URL(string: uri)!)
            webView.load(request)
        } else {
            //显示字符串

            //由于服务端，返回的字符串，不是一个完整的HTML字符串
            //同时本地可能希望添加一些字体设置，所以要前后拼接为一个
            //完整的HTML字符串
            var buffer = String(SuperWebController.CONTENT_WRAPPER_START)
            //添加内容
            buffer.append(content!)
            buffer.append(SuperWebController.CONTENT_WRAPPER_END)
            //加载字符串
            webView.loadHTMLString(buffer, baseURL: URL(string: SuperWebController.WEBVIEW_BASE_URL))
        }
    }

    override func leftClick(_ sender: QMUIButton) {
        if webView.canGoBack {
            webView.goBack()
            return
        }

        super.leftClick(sender)
    }

    override func rightClick(_ sender: QMUIButton) {
        finish()
    }

    /// 获取配置
    /// - Returns: <#description#>
    static func defaultConfiguration() -> WKWebViewConfiguration {
        let r = WKWebViewConfiguration()
        if #available(iOS 10.0, *) {
            r.mediaTypesRequiringUserActionForPlayback = .all
        } else if #available(iOS 9.0, *) {
            r.requiresUserActionForMediaPlayback = false
        } else {
            r.mediaPlaybackRequiresUserAction = false
        }
        return r
    }

    lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero, configuration: SuperWebController.defaultConfiguration())
        webView.tg_width.equal(.fill)
        webView.tg_height.equal(.fill)
//        webView.navigationDelegate = self
//        webView.uiDelegate = self
        return webView
    }()

    lazy var progressView: UIProgressView = {

        let r = UIProgressView()
        r.tg_width.equal(.fill)
        r.tg_height.equal(1)
        r.progressTintColor = .colorPrimary
        return r

    }()

    override func initListeners() {
        super.initListeners()

        if SuperStringUtil.isBlank(title) {
            // 坚挺网页标题
            webView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
        }

        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }

    /// 监听网页标题
    ///
    /// - Parameters:
    ///   - keyPath:
    ///   - object:
    ///   - change:
    ///   - context:
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if let _ = object as? WKWebView {
            if keyPath == "title" {
                self.title = webView.title
            } else if keyPath == "estimatedProgress" {
//                progressView.setProgress(Float(webView.estimatedProgress), animated: true)
                let progress = change?[.newKey] as? Float ?? 0
                progressView.progress = progress

                if progress < 1 {
                    progressView.show()
                    progressView.alpha = 1
                } else {
                    UIView.animate(withDuration: 0.35, delay: 0.15, animations: {
                        self.progressView.alpha = 0
                    }, completion: { _ in
                        self.progressView.hide()
                        self.progressView.setProgress(0, animated: false)
                        self.progressView.alpha = 1
                    })
                }
            }
        }
    }

    static let CONTENT_WRAPPER_START = "<!DOCTYPE html><html><head><title></title><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\"><style type=\"text/css\"> body{font-family: Helvetica Neue,Helvetica,PingFang SC,Hiragino Sans GB,Microsoft YaHei,Arial,sans-serif;word-wrap: break-word;word-break: normal;} h2{text-align: center;} img {max-width: 100%;} pre{word-wrap: break-word!important;overflow: auto;}</style></head><body>"
    static let CONTENT_WRAPPER_END = "</body></html>"
    static let WEBVIEW_BASE_URL = "http:http://ixuea.com"
}

extension SuperWebController {

    /// 启动方法
    /// - Parameters:
    ///   - controller: <#controller description#>
    ///   - title: <#title description#>
    ///   - uri: <#uri description#>
    ///   - content: <#content description#>
    static func start(_ controller: UINavigationController, title: String? = nil, uri: String? = nil, content: String? = nil) {
        let target = SuperWebController()
//        target.title = title
        target.uri = uri
        target.content = content
        controller.pushViewController(target, animated: true)
    }
}
