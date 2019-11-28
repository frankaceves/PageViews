//
//  TutorialViewController.swift
//  PageViews
//
//  Created by Frank Aceves on 11/12/19.
//  Copyright © 2019 Frank Aceves. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tutorialPageViewController = segue.destination as? TutorialPageViewController {
            tutorialPageViewController.tutorialDelegate = self
        }
    }
}

extension TutorialViewController: TutorialPageViewControllerDelegate {
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
    
}
