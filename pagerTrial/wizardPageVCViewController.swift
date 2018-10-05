//
//  wizardPageVCViewController.swift
//  pagerTrial
//
//  Created by ios1 on 19/04/18.
//  Copyright © 2018 ios1. All rights reserved.
//

import UIKit

class wizardPageVCViewController: UIPageViewController {
    var homeInstance: homeVC?
    var pageModels : [AbstractPage] = []
    enum page{
        static let SCREEN1 = 0,
        SCREEN2 = 1,
        SCREEN3 = 2,
        SCREEN4 = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: options)
        loadDataModels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadDataModels() {
        pageModels = [ Screen1DataModel(key: "Screen1", title: "1"),
                       Screen2DataModel(key: "Screen2", title: "2"),
                       Screen3DataModel(key: "Screen3", title: "3")
        ]
    }
    func nextPage(){
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let nextViewController = dataSource?.pageViewController( self, viewControllerAfter: currentViewController ) else { return }
        setViewControllers([nextViewController], direction: .forward, animated: true) { (Bool) -> Void in
        }
    }
    func previousPage(){
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let previousViewController = dataSource?.pageViewController( self, viewControllerBefore: currentViewController ) else { return }
        setViewControllers([previousViewController], direction: .reverse, animated: true) {
            (Bool) -> Void in
        }
    }
}
