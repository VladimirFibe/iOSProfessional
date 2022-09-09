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
    let page1 = OnboardingViewController(heroImageName: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you fell like you are back in 1989.")
    let page2 = OnboardingViewController(heroImageName: "world", titleText: "Move your money around the world quickly and securely.")
    let page3 = OnboardingViewController(heroImageName: "thumbs", titleText: "Learn more at www.bankey.com ")
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
