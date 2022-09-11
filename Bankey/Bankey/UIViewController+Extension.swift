//
//  UIViewController+Extension.swift
//  Bankey
//
//  Created by Vladimir Fibe on 11.09.2022.
//

import UIKit

extension UIViewController {
  func setStatusBar() {
    
    let navBarAppearance = UINavigationBarAppearance()
    navBarAppearance.configureWithOpaqueBackground()
    navBarAppearance.backgroundColor = .appColor
    UINavigationBar.appearance().standardAppearance = navBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
  }
  
  func setTabBarImage(imageName: String, title: String) {
    let configuration = UIImage.SymbolConfiguration(scale: .large)
    let image = UIImage(systemName: imageName, withConfiguration: configuration)
    tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
  }
}
