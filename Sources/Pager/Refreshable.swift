//
//  Created by iWw on 2021/1/6.
//

import UIKit

public protocol Refreshable {
    func beginRefreshing()
}

public extension Refreshable where Self: Pager {
    
    func beginRefreshing() {
        guard let current = self.currentViewController as? Refreshable else {
            return
        }
        current.beginRefreshing()
    }
    
}
