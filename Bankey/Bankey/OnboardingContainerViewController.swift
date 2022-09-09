//
//  OnboardingContainerViewController.swift
//  Bankey
//
//  Created by Vladimir Fibe on 08.09.2022.
//

import UIKit

class OnboardingContainerViewController: UIViewController {
  let pageViewController: UIPageViewController
  var pages = [UIViewController]()
  var currentVC: UIViewController
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    let page1 = ViewController1()
    let page2 = ViewController2()
    let page3 = ViewController3()
    pages = [page1, page2, page3]
    currentVC = page1
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemPurple
    addChild(pageViewController)
    view.addSubview(pageViewController.view)
    pageViewController.didMove(toParent: self)
    pageViewController.dataSource = self
    pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
      view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
      view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
      view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor)
    ])
    pageViewController.setViewControllers([currentVC], direction: .forward, animated: false, completion: nil)
  }
}

extension OnboardingContainerViewController: UIPageViewControllerDataSource {
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let index = pages.firstIndex(of: viewController), index > 0 else { return nil }
    currentVC = pages[index - 1]
    return currentVC
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
    currentVC = pages[index + 1]
    return currentVC
  }
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    pages.count
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    pages.firstIndex(of: currentVC) ?? 0
  }
}

class ViewController1: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemRed
  }
}

class ViewController2: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGreen
  }
}

class ViewController3: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBlue
  }
}
