//
//  UIViewController+Extension.swift
//  Bankey
//
//  Created by Vladimir Fibe on 11.09.2022.
//

import UIKit

extension UIViewController {
  func setStatusBar() {
    let statusBarSize = UIApplication.shared.statusBarFrame.size // deprecated
    
    let frame = CGRect(origin: .zero, size: statusBarSize)
    let statusbarView = UIView(frame: frame)
    statusbarView.backgroundColor = .appColor
    view.addSubview(statusbarView)
  }
  
  func setTabBarImage(imageName: String, title: String) {
    let configuration = UIImage.SymbolConfiguration(scale: .large)
    let image = UIImage(systemName: imageName, withConfiguration: configuration)
    tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
  }
}
