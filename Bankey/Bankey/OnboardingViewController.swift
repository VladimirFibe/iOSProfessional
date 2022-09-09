//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Vladimir Fibe on 09.09.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
  let imageView: UIImageView = {
    $0.contentMode = .scaleAspectFit
    return $0
  }(UIImageView(image: UIImage(named: "delorean.pdf")))
  let label: UILabel = {
    $0.textAlignment = .center
    $0.adjustsFontForContentSizeCategory = true
    $0.numberOfLines = 0
    $0.text = "Bankey is faster, easier to use, and has a brand new look and feel that will make you fell like you are back in 1989."
    $0.font = .preferredFont(forTextStyle: .title3)
    return $0
  }(UILabel())
  lazy var stackView: UIStackView = {
    $0.axis = .vertical
    $0.spacing = 20
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIStackView(arrangedSubviews: [imageView, label]))
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
    setupConstraints()
  }
  
  
  
}

extension OnboardingViewController {
  func setupViews() {
    view.addSubview(stackView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
    ])
  }
}
