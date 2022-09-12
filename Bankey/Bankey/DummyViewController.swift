import UIKit

protocol DummyViewControllerDelegate: AnyObject {
    func logout()
}
class DummyViewController: UIViewController {
    weak var delegate: DummyViewControllerDelegate?
    
    let label: UILabel = {
        $0.text = "Welcome"
        $0.textAlignment = .center
        $0.font = .preferredFont(forTextStyle: .title1)
        return $0
    }(UILabel())
    
    lazy var logoutButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Logout"
        let primatyAction = UIAction { _ in
            self.delegate?.logout()
        }
        let button = UIButton(configuration: configuration, primaryAction: primatyAction)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 20
        return $0
    }(UIStackView(arrangedSubviews: [label, logoutButton]))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

extension DummyViewController {
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
