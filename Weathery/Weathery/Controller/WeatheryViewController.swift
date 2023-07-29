import UIKit

class WeatheryViewController: UIViewController {

    private let backgroundView = UIImageView()
    private let rootStackView = UIStackView()
    private let searchStackView = UIStackView()
    private let locationButton = UIButton(type: .system)
    private let searchTextField = UITextField()
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
        setupRootStackView()
        setupSearchStackView()
        setupLocationButton()
        setupSearchTextField()
        setupSearchButton()
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
    
    private func setupRootStackView() {
        view.addSubview(rootStackView)
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        rootStackView.axis = .vertical
        rootStackView.spacing = 10
        rootStackView.alignment = .trailing
        
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    private func setupSearchStackView() {
        rootStackView.addArrangedSubview(searchStackView)
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        searchStackView.axis = .horizontal
        searchStackView.spacing = 10
        searchStackView.widthAnchor.constraint(equalTo: rootStackView.widthAnchor).isActive = true
    }
    
    private func setupLocationButton() {
        searchStackView.addArrangedSubview(locationButton)
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.setBackgroundImage(UIImage(systemName: "location.north.circle.fill"), for: [])
        locationButton.tintColor = .label
        locationButton.addTarget(self, action: #selector(didTapLocationButton), for: .primaryActionTriggered)
        NSLayoutConstraint.activate([
            locationButton.widthAnchor.constraint(equalToConstant: 44),
            locationButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupSearchTextField() {
        searchStackView.addArrangedSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search"
        searchTextField.font = .preferredFont(forTextStyle: .title1)
        searchTextField.textAlignment = .right
        searchTextField.borderStyle = .roundedRect
        searchTextField.backgroundColor = .systemFill
    }
    
    private func setupSearchButton() {
        searchStackView.addArrangedSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: [])
        searchButton.tintColor = .label
        searchButton.addTarget(self, action: #selector(didTapSearchButton), for: .primaryActionTriggered)
        NSLayoutConstraint.activate([
            searchButton.widthAnchor.constraint(equalTo: locationButton.widthAnchor),
            searchButton.heightAnchor.constraint(equalTo: locationButton.heightAnchor)
        ])
    }
    
    private func setupConditionImageView() {
        rootStackView.addArrangedSubview(conditionImageView)
        conditionImageView.image = UIImage(systemName: "cloud.bolt")
        conditionImageView.tintColor = .label
        NSLayoutConstraint.activate([
            conditionImageView.widthAnchor.constraint(equalToConstant: 120),
            conditionImageView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func setupTemperatureLabel() {
        rootStackView.addArrangedSubview(temperatureLabel)
        temperatureLabel.attributedText = makeTemperatureText(with: "22")
    }
    
    private func setupCityLabel() {
        rootStackView.addArrangedSubview(cityLabel)
        cityLabel.text = "San Francisco"
        cityLabel.font = .preferredFont(forTextStyle: .largeTitle)
    }
    
    private func makeTemperatureText(with temperature: String) -> NSAttributedString {
        let boldTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.label,
            .font: UIFont.boldSystemFont(ofSize: 100)
        ]
        let plainTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 80)
        ]
        let text = NSMutableAttributedString(string: temperature, attributes: boldTextAttributes)
        text.append(NSAttributedString(string: "ºC", attributes: plainTextAttributes))
        return text
    }
    
    func makeAttributed2() -> NSAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .callout),
            .baselineOffset: 8]
        let priceAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .title1)]
        let monthAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .callout)]
        let termAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .footnote),
                .baselineOffset: 8]

        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let priceString = NSAttributedString(string: "8", attributes: priceAttributes)
        let monthString = NSAttributedString(string: "/mo", attributes: monthAttributes)
        let termString = NSAttributedString(string: "1", attributes: termAttributes)

        rootString.append(priceString)
        rootString.append(monthString)
        rootString.append(termString)

        return rootString
    }
}
