//
//  TutorialPageViewController.swift
//  PageViews
//
//  Created by Frank Aceves on 11/12/19.
//  Copyright © 2019 Frank Aceves. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController {
    weak var tutorialDelegate: TutorialPageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        tutorialDelegate?.tutorialPageViewController(tutorialPageViewController: self, didUpdatePageCount: orderedViewControllers.count)
    }
    
    private lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController("green"),
            self.newColoredViewController("red"),
            self.newColoredViewController("blue")]
    }()
    
    
    
    private func newColoredViewController(_ color: String) -> UIViewController {

        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(color)VC") as! GradientViewController
        
//        let layer = CAGradientLayer()
//        let purple = UIColor(red:0.35, green:0.17, blue:0.47, alpha:1.0).cgColor
//        let green = UIColor(red:0.39, green:0.74, blue:0.60, alpha:1.0).cgColor
//        layer.colors = [purple, green]
//        layer.frame = view.bounds
//        vc.view.layer.insertSublayer(layer, at: 0)
        //view.layer.insertSublayer(layer, at: 1)
        
        return vc
    }
}



extension TutorialPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print(#function)
        
        if let firstViewController = viewControllers?.first, let index = orderedViewControllers.firstIndex(of: firstViewController) {
            tutorialDelegate?.tutorialPageViewController(tutorialPageViewController: self, didUpdatePageIndex: index)
            print("index: \(index)")
            print("viewcontrollers: \(viewControllers!)")
        }
    }
    
}


extension TutorialPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //print(#function)
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //print(#function)
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count

        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
}
