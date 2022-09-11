//
//  WeatherViewController.swift
//  Bankey
//
//  Created by Vladimir Fibe on 10.09.2022.
// https://stackoverflow.com/questions/68328038/imageedgeinsets-was-deprecated-in-ios-15-0

import UIKit

class WeatherViewController: UIViewController {
  
  let weatherService = WeatherService()
  lazy var weatherButton: UIButton = {
    var configuration = UIButton.Configuration.filled()
    configuration.title = "Fetch Weather"
    let primatyAction = UIAction { action in
      self.weatherService.fetchWeather()
    }
    let button = UIButton(configuration: configuration, primaryAction: primatyAction)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  let cityLabel = makeLabel(withTitle: "City")
  let temperatureLabel = makeLabel(withTitle: "°C")
  let imageView: UIImageView = {
    let configuration = UIImage.SymbolConfiguration(scale: .large)
    let image = UIImage(systemName: "bell", withConfiguration: configuration)
    $0.image = image
    $0.setContentHuggingPriority(UILayoutPriority(rawValue: 999), for: .horizontal)
    return $0
  }(UIImageView())
  lazy var stackView: UIStackView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.axis = .horizontal
    return $0
  }(UIStackView(arrangedSubviews: [cityLabel, imageView, temperatureLabel]))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
  }
  
  func setupViews() {
    navigationItem.title = "Weather Delegate"
    weatherService.delegate = self
    weatherService.dataSource = self
    view.addSubview(weatherButton)
    view.addSubview(stackView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      weatherButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      weatherButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 3),
      stackView.topAnchor.constraint(equalToSystemSpacingBelow: weatherButton.bottomAnchor, multiplier: 3),
      stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
      cityLabel.widthAnchor.constraint(equalTo: temperatureLabel.widthAnchor)
    ])
  }
  
  @objc func weatherPressed() {
    weatherService.fetchWeather()
  }
}

func makeLabel(withTitle title: String) -> UILabel {
  let label = UILabel()
  label.translatesAutoresizingMaskIntoConstraints = false
  label.text = title
  label.textAlignment = .center
  label.textColor = .black
  label.numberOfLines = 0
  label.adjustsFontSizeToFitWidth = true
  return label
}

extension WeatherViewController: WeatherServiceDelegate {
  func didFetchWeather(_ weather: Weather) {
    cityLabel.text = weather.city
    temperatureLabel.text = weather.temperature
    let configuration = UIImage.SymbolConfiguration(scale: .large)
    let image = UIImage(systemName: weather.imageName, withConfiguration: configuration)
    imageView.image = image
  }
}

extension WeatherViewController: WeatherServiceDataSource {
  var city: String? {
    "San Francisco"
  }
}
