import UIKit

class WeatheryViewController: UIViewController {

    private let backgroundView = UIImageView()
    private let searchTextField = UITextField()
    private let locationButton = UIButton(type: .system)
    private let searchButton = UIButton(type: .system)
    private let conditionImageView = UIImageView()
    private let temperatureLabel = UILabel()
    private let cityLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
}
// MARK: - Actions
extension WeatheryViewController {
    @objc private func didTapLocationButton() {
        print(#function)
    }
    
    @objc private func didTapSearchButton() {
        print(#function)
    }
}
// MARK: - Setup Views
extension WeatheryViewController {
    private func setupViews() {
        setupBackgroundView()
        setupLocationButton()
        setupSearchButton()
        setupSearchTextField()
        setupConditionImageView()
        setupTemperatureLabel()
        setupCityLabel()
    }
    
    private func setupBackgroundView() {
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.image = UIImage(named: "background")
        backgroundView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupLocationButton() {
        view.addSubview(locationButton)
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.setBackgroundImage(UIImage(systemName: "location.north.circle.fill"), for: [])
        locationButton.tintColor = .label
        locationButton.addTarget(self, action: #selector(didTapLocationButton), for: .primaryActionTriggered)
        NSLayoutConstraint.activate([
            locationButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            locationButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            locationButton.widthAnchor.constraint(equalToConstant: 44),
            locationButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupSearchButton() {
        view.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: [])
        searchButton.tintColor = .label
        searchButton.addTarget(self, action: #selector(didTapSearchButton), for: .primaryActionTriggered)
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: locationButton.topAnchor),
            searchButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            searchButton.widthAnchor.constraint(equalTo: locationButton.widthAnchor),
            searchButton.heightAnchor.constraint(equalTo: locationButton.heightAnchor)
        ])
    }
    
    private func setupSearchTextField() {
        view.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search"
        searchTextField.font = .preferredFont(forTextStyle: .title1)
        searchTextField.textAlignment = .right
        searchTextField.borderStyle = .roundedRect
        searchTextField.backgroundColor = .systemFill
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: locationButton.topAnchor),
            searchTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: locationButton.trailingAnchor, multiplier: 1),
            searchButton.leadingAnchor.constraint(equalToSystemSpacingAfter: searchTextField.trailingAnchor, multiplier: 1)
        ])
        
    }
    
    private func setupConditionImageView() {
        
    }
    
    private func setupTemperatureLabel() {
        
    }
    
    private func setupCityLabel() {
        
    }
}
