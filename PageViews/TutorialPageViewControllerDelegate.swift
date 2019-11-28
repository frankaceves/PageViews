//
//  TutorialPageViewControllerDelegate.swift
//  PageViews
//
//  Created by Frank Aceves on 11/12/19.
//  Copyright © 2019 Frank Aceves. All rights reserved.
//

protocol TutorialPageViewControllerDelegate: class {
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController, didUpdatePageCount count: Int)
    
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController, didUpdatePageIndex index: Int)
}
