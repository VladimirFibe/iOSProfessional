//
//  AppDelegate.swift
//  Bankey
//
//  Created by Vladimir Fibe on 08.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  let onboarding = OnboardingContainerViewController()
  let login = LoginViewController()
  let welcome = DummyViewController()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    onboarding.delegate = self
    login.delegate = self
    welcome.delegate = self
    window.rootViewController = login
    window.backgroundColor = .systemBackground
    window.makeKeyAndVisible()
    self.window = window
    return true
  }
}

extension AppDelegate: LoginViewControllerDelegate {
  func didLogin(_ sender: LoginViewController) {
    if LocalState.hasOnboarded {
      setRootViewController(welcome)
    } else {
      setRootViewController(onboarding)
    }
  }
}

extension AppDelegate: OnboardingContainerViewDelegate {
  func didFinishOnboarding() {
    LocalState.hasOnboarded = true
    setRootViewController(welcome)
  }
}

extension AppDelegate: DummyViewControllerDelegate {
  func logout() {
    setRootViewController(login)
  }
}
extension AppDelegate {
  func setRootViewController(_ viewcontroller: UIViewController, animated: Bool = true) {
    guard animated, let window = self.window else {
      self.window?.rootViewController = viewcontroller
      self.window?.makeKeyAndVisible()
      return
    }
    window.rootViewController = viewcontroller
    window.makeKeyAndVisible()
    UIView.transition(with: window,
                      duration: 0.3,
                      options: .transitionCrossDissolve,
                      animations: nil,
                      completion: nil
    )
  }
}
