//
// Created by seaony on 2023/3/26.
//

import UIKit

class UserDetailController: BaseTitleController {

    var id: String!

    var nickname: String!

}

extension UserDetailController {
    static func start(_ controller: UINavigationController, id: String, nickname: String? = nil) {
        let target = UserDetailController()
        target.id = id
        target.nickname = nickname
        controller.pushViewController(target, animated: true)
    }
}
