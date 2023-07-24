import UIKit

class ViewController: UIViewController {
    private let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupButton()
    }
}
// MARK: Setup Views
extension ViewController {
    private func setupButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("button", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            view.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: 80),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

