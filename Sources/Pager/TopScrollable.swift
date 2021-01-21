//
//  Created by iWw on 2021/1/6.
//

import UIKit

public protocol TopScrollable {
    func scrollToTop()
}

public extension TopScrollable where Self: Pagable {
    
    func scrollToTop() {
        pager.scrollToTop()
    }
}
