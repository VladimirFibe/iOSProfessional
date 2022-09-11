//
//  OnboardingContainerViewController.swift
//  Bankey
//
//  Created by Vladimir Fibe on 08.09.2022.
//

import UIKit

protocol OnboardingContainerViewDelegate: AnyObject {
  func didFinishOnboarding()
}

class OnboardingContainerViewController: UIViewController {
  weak var delegate: OnboardingContainerViewDelegate?
  let pageViewController: UIPageViewController
  var pages = [UIViewController]()
  var currentIndex: Int? {
    pages.firstIndex(of: currentVC)
  }
  var currentVC: UIViewController {
    didSet {
      if let index = currentIndex {
        nextButton.isHidden = index == pages.count - 1
        backButton.isHidden = index == 0
        doneButton.isHidden = index < pages.count - 1
      }
    }
  }
  
  lazy var nextButton: UIButton = {
    var configuration = UIButton.Configuration.filled()
    configuration.title = "Next"
    let primatyAction = UIAction { action in
      self.next()
    }
    let button = UIButton(configuration: configuration, primaryAction: primatyAction)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  lazy var backButton: UIButton = {
    var configuration = UIButton.Configuration.filled()
    configuration.title = "Back"
    let primatyAction = UIAction { action in
      self.back()
    }
    let button = UIButton(configuration: configuration, primaryAction: primatyAction)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.isHidden = true
    return button
  }()
  
  lazy var closeButton: UIButton = {
    var configuration = UIButton.Configuration.filled()
    configuration.title = "Close"
    let primatyAction = UIAction { action in
      self.delegate?.didFinishOnboarding()
    }
    let button = UIButton(configuration: configuration, primaryAction: primatyAction)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  lazy var doneButton: UIButton = {
    var configuration = UIButton.Configuration.filled()
    configuration.title = "Done"
    let primatyAction = UIAction { action in
      self.delegate?.didFinishOnboarding()
    }
    let button = UIButton(configuration: configuration, primaryAction: primatyAction)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.isHidden = true
    return button
  }()
  
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
    view.addSubview(closeButton)
    view.addSubview(backButton)
    view.addSubview(nextButton)
    view.addSubview(doneButton)
    pageViewController.didMove(toParent: self)
    pageViewController.dataSource = self
    pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
      view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
      view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
      view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
      closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
      closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
      backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: backButton.bottomAnchor, multiplier: 4),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 2),
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 4),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: doneButton.trailingAnchor, multiplier: 2),
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: doneButton.bottomAnchor, multiplier: 4),
    ])
    pageViewController.setViewControllers([currentVC], direction: .forward, animated: false, completion: nil)
  }
  
  func back() {
    if let index = currentIndex, index > 0 {
      currentVC = pages[index - 1]
    }
  }
  
  func next() {
    if let index = currentIndex, index + 1 < pages.count {
      currentVC = pages[index + 1]
    }
  }
}

extension OnboardingContainerViewController: UIPageViewControllerDataSource {
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    back()
    return currentVC
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    next()
    return currentVC
  }
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    pages.count
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    pages.firstIndex(of: currentVC) ?? 0
  }
}
