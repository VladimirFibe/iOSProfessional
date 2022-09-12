import UIKit

class OnboardingViewController: UIViewController {
    
    let heroImageName: String
    let titleText: String
    
    lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView(image: UIImage(named: heroImageName)))
    
    lazy var label: UILabel = {
        $0.text = titleText
        $0.textAlignment = .center
        $0.adjustsFontForContentSizeCategory = true
        $0.numberOfLines = 0
        $0.font = .preferredFont(forTextStyle: .title3)
        return $0
    }(UILabel())
    
    lazy var stackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView(arrangedSubviews: [imageView, label]))
    
    init(heroImageName: String, titleText: String) {
        self.heroImageName = heroImageName
        self.titleText = titleText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

extension OnboardingViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
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
