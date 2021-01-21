//
//  ViewController.swift
//  Pager
//
//  Created by iWw on 2021/1/6.
//

import UIKit

class ViewController: UIViewController {
    
    let pager = Pager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        segmenter.segments = [.init(title: "艺人"), .init(title: "专辑"), .init(title: "歌曲"), .init(title: "white")]
        
        let redController = UIViewController()
        redController.view.backgroundColor = .red
        
        let blueController = UIViewController()
        blueController.view.backgroundColor = .blue
        
        let brownController = UIViewController()
        brownController.view.backgroundColor = .brown
        
        let whiteController = UIViewController()
        whiteController.view.backgroundColor = .white
        
        pager.viewControllers = [whiteController, redController, blueController, brownController]
        pager.moveTo(self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        segmenter.frame = .init(x: 0, y: 0, width: view.bounds.width, height: UIApplication.shared.statusBarFrame.height + 44)
        let segmenterHeight: CGFloat = 0 // segmenter.frame.height
        pager.view.frame = .init(x: 0, y: segmenterHeight, width: view.bounds.width, height: view.bounds.height - segmenterHeight)
    }

}

