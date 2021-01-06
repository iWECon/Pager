  //
//  Created by iWw on 2021/1/6.
//

import UIKit

public protocol Pagable: Refreshable, TopScrollable {
    var pager: Pager { get }
}
