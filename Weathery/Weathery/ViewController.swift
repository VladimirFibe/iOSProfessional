import UIKit

class ViewController: UIViewController {
    private let label = UILabel()
    private let textField = UITextField()
    private let button = UIButton(type: .system)
    private let redButton = UIButton(type: .system)
    private let blueButton = UIButton(type: .system)
    private let stackView = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLabel()
        setupRedButton()
        setupTextField()
        setupStackView()
    }
}
// MARK: Setup Views
extension ViewController {
    
    private func setupLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "upperleft"
        label.backgroundColor = .systemYellow
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
        ])
    }
    
    private func setupButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("button", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupRedButton() {
        view.addSubview(redButton)
        redButton.translatesAutoresizingMaskIntoConstraints = false
        redButton.backgroundColor = .red
        NSLayoutConstraint.activate([
            redButton.widthAnchor.constraint(equalToConstant: 88),
            redButton.heightAnchor.constraint(equalToConstant: 44),
            redButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupBlueButton() {
        view.addSubview(blueButton)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.backgroundColor = .blue
        blueButton.setTitle("upperRight", for: [])
        NSLayoutConstraint.activate([
            blueButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            blueButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    private func setupTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemBlue
        textField.placeholder = "Enter Name"
        textField.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        textField.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: label.topAnchor),
            textField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 1)
        ])
    }
    
    func makeLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemYellow
        label.text = text
        label.textAlignment = .center
        return label
    }
    
    private func setupStackView() {
        let label1 = makeLabel("Tron")
        let label2 = makeLabel("Remo Williams")
        let label3 = makeLabel("Adventures in Babysitting")
        let label4 = makeLabel("Krull")
        let label5 = makeLabel("Ghost Busters")
        let label6 = makeLabel("The Right Stuff")
        let label7 = makeLabel("Big Trouble in Little China")
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(label3)
        stackView.addArrangedSubview(label4)
        stackView.addArrangedSubview(label5)
        stackView.addArrangedSubview(label6)
        stackView.addArrangedSubview(label7)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

