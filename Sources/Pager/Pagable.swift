//
//  Created by iWw on 2021/1/6.
//

import UIKit

struct PagableKeys {
    static var pagerKey = "PagableKeys.pagerKey"
}

public typealias PagerCollectionViewProvider = (_: CGRect, _: UICollectionViewLayout) -> UICollectionView
public typealias PagerCollectionViewLayoutProvider = () -> UICollectionViewFlowLayout

public protocol Pagable: Refreshable, TopScrollable {
    
    var pagerCollectionViewProvider: PagerCollectionViewProvider? { get }
    var pagerCollectionViewLayoutProvider: PagerCollectionViewLayoutProvider? { get }
    
    var pager: Pager { get set }
}

public extension Pagable where Self: UIViewController {
    
    var pagerCollectionViewProvider: PagerCollectionViewProvider? {
        nil
    }
    
    var pagerCollectionViewLayoutProvider: PagerCollectionViewLayoutProvider? {
        nil
    }
    
    var pager: Pager {
        get {
            guard let pager = objc_getAssociatedObject(self, &PagableKeys.pagerKey) as? Pager else {
                let pager = Pager()
                objc_setAssociatedObject(self, &PagableKeys.pagerKey, pager, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                pager.moveTo(self)
                return pager
            }
            return pager
        }
        set {
            objc_setAssociatedObject(self, &PagableKeys.pagerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
}
