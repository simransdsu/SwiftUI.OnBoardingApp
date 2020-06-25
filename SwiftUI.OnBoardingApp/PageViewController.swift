//
//  PageViewController.swift
//  SwiftUI.OnBoardingApp
//
//  Created by jc on 2020-06-24.
//  Copyright © 2020 jc. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct PageViewController : UIViewControllerRepresentable {
    typealias UIViewControllerType = UIPageViewController
    
    @Binding var currentPageIndex: Int
    
    var viewController: [UIViewController]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        return pageViewController
        
    }
    
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([viewController[currentPageIndex]], direction: .forward, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.viewController.firstIndex(of: viewController) else { return nil}
            
            if index == 0 {
                return parent.viewController.last
            }
            
            return parent.viewController[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = pageViewController.viewControllers?.firstIndex(of: viewController) else { return nil }
            
            if index + 1 == parent.viewController.count {
                return parent.viewController.first
            }
            
            return parent.viewController[index + 1]
        }
        
        var parent: PageViewController
        
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
    }
    
}
