
import UIKit
import YTPageController

open class Pager: PageController, PageControllerDelegate, TopScrollable, Refreshable {
    
    weak public var pagerDelegate: PageControllerDelegate?
    override public var delegate: PageControllerDelegate? {
        get {
            self
        }
        set {
            pagerDelegate = newValue
        }
    }
    
    private var collectionView: UICollectionView? {
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
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let vc = self.currentViewController, vc.parent == nil {
            let _ = vc.view
            addChild(vc)
            vc.beginAppearanceTransition(true, animated: true)
            // vc.viewWillAppear(animated)
        }
    }
    
    public func scrollToTop() {
        if let current = self.currentViewController as? TopScrollable {
            current.scrollToTop()
        }
    }
    
    public func beginRefreshing() {
        if let current = self.currentViewController as? Refreshable {
            current.beginRefreshing()
        }
    }
    
    public func pageController(_ pageController: PageController, didEndTransition context: PageTransitionContext) {
        pagerDelegate?.pageController?(pageController, didEndTransition: context)
    }
    
    public func pageController(_ pageController: PageController, didUpdateTransition context: PageTransitionContext) {
        pagerDelegate?.pageController?(pageController, didUpdateTransition: context)
    }
    
    @discardableResult
    public func moveTo(_ viewController: UIViewController) -> Self {
        willMove(toParent: viewController)
        viewController.addChild(self)
        viewController.view.addSubview(view)
        view.frame = viewController.view.bounds
        didMove(toParent: viewController)
        return self
    }
}
