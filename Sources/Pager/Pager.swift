
import UIKit
import YTPageController

open class Pager: PageController, PageControllerDelegate, TopScrollable, Refreshable {
    
    weak public var pagerDelegate: PageControllerDelegate?
    override open var delegate: PageControllerDelegate? {
        get {
            self
        }
        set {
            pagerDelegate = newValue
        }
    }
    
    public var collectionView: UICollectionView? {
        value(forKey: "_collectionView") as? UICollectionView
    }
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        super.delegate = self
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        super.delegate = self
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let vc = self.currentViewController, vc.parent == nil {
            let _ = vc.view
            addChild(vc)
            vc.beginAppearanceTransition(true, animated: true)
            // vc.viewWillAppear(animated)
        }
    }
    
    open func scrollToTop() {
        if let current = self.currentViewController as? TopScrollable {
            current.scrollToTop()
        }
        
    }
    
    open func beginRefreshing() {
        if let current = self.currentViewController as? Refreshable {
            current.beginRefreshing()
        }
    }
    
    open func pageController(_ pageController: PageController, willStartTransition context: PageTransitionContext) {
        pagerDelegate?.pageController?(pageController, willStartTransition: context)
    }
    
    open func pageController(_ pageController: PageController, didEndTransition context: PageTransitionContext) {
        pagerDelegate?.pageController?(pageController, didEndTransition: context)
    }
    
    open func pageController(_ pageController: PageController, didUpdateTransition context: PageTransitionContext) {
        pagerDelegate?.pageController?(pageController, didUpdateTransition: context)
    }
    
    @discardableResult
    open func moveTo(_ viewController: UIViewController) -> Self {
        willMove(toParent: viewController)
        viewController.addChild(self)
        if let pagable = viewController as? Pagable {
            if let pvlp = pagable.pagerCollectionViewLayout {
                self.collectionViewLayoutProvider = { () -> UICollectionViewFlowLayout in
                    pvlp
                }
            }
            if let pvp = pagable.pagerCollectionView {
                self.collectionViewProvider = { (rect, layout) -> UICollectionView in
                    pvp(rect, layout)
                }
            }
        }
        viewController.view.addSubview(view)
        view.frame = viewController.view.bounds
        didMove(toParent: viewController)
        return self
    }
}
