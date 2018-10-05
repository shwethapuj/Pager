//
//  homeVC.swift
//  pagerTrial
//
//  Created by ios1 on 19/04/18.
//  Copyright © 2018 ios1. All rights reserved.
//

import UIKit

class homeVC: UIViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [TextFieldVC(),
                DropDownVC(),
                ToggleVC(),
                ReviewVC()]
    }()
    var localPageIndex = 0
    var pageViewController : UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startButtonClicked(_ sender: UIButton) {
        self.pageViewController = wizardPageVCViewController()
        (self.pageViewController as! wizardPageVCViewController).homeInstance = self
        (self.pageViewController as! wizardPageVCViewController).delegate = self
        (self.pageViewController as! wizardPageVCViewController).dataSource = self
        if let firstViewController = self.orderedViewControllers.first {
            self.pageViewController?.setViewControllers([firstViewController],
                                                       direction: .forward,
                                                       animated: true,
                                                       completion: nil)
        }
        self.pageViewController?.view.frame = CGRect(x: 0.0, y: 50.0, width: self.view.frame.width, height: self.view.frame.height - 50)
        self.addChildViewController(pageViewController!)
        self.view.addSubview((pageViewController?.view)!)
        self.pageViewController?.didMove(toParentViewController: self)
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! BaseVC).pageIndex
        if(index <= 0){
            return nil
        }
        index = index - 1
        
        if((self.orderedViewControllers.count == 0) || (index >= self.orderedViewControllers.count)) {
            return nil
        }
        (self.orderedViewControllers[index] as! BaseVC).pageIndex = index
        
        return self.orderedViewControllers[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! BaseVC).pageIndex
        index = index + 1
        if(index >= self.orderedViewControllers.count){
            return nil
        }
        if((self.orderedViewControllers.count == 0) || (index >= self.orderedViewControllers.count)) {
            return nil
        }
        (self.orderedViewControllers[index] as! BaseVC).pageIndex = index
        
        return self.orderedViewControllers[index]
    }
    
    func viewControllerAtIndex(index : Int) -> UIViewController? {
        if((self.orderedViewControllers.count == 0) || (index >= self.orderedViewControllers.count)) {
            return nil
        }
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageContentVC") as! PageContentVC
        pageContentViewController.pageIndex = index
        return pageContentViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.localPageIndex = orderedViewControllers.index(of: pageContentViewController)!
    }

}
