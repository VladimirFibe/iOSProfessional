import UIKit

class AccountSummaryViewController: UIViewController {
    struct Profile {
        let firstname: String
        let lastname: String
    }
    var profile: Profile?
    var accounts: [AccountSummaryCell.ViewModel] = []
    var header = AccountSummaryHeaderView(frame: .zero)
    
    lazy var logoutBarButtonItem: UIBarButtonItem = {
        $0.tintColor = .label
        return $0
    }(UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped)))
    
    var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupTableHeaderView()
        fetchAccounts()
        setupNavigationBar()
    }
}
// MARK: - SETUP
extension AccountSummaryViewController {
    func setupViews() {
        view.addSubview(tableView)
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseIdentifier)
        tableView.rowHeight = AccountSummaryCell.rowHeight
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .appColor
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupTableHeaderView() {
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        tableView.tableHeaderView = header
    }
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = logoutBarButtonItem
    }
}
// MARK: - UITABLEVIEWDELEGATE
extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
// MARK: - DATA SOURCE
extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accounts.isEmpty else { return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(
            withIdentifier: AccountSummaryCell.reuseIdentifier,
            for: indexPath) as! AccountSummaryCell
        let account = accounts[indexPath.item]
        cell.configure(with: account)
        return cell
    }
    
    private func fetchAccounts() {
        accounts = [
            AccountSummaryCell.ViewModel(accountType: .banking,
                                         accountName: "Basic Savings",
                                         balance: 929466.23),
            AccountSummaryCell.ViewModel(accountType: .banking,
                                         accountName: "No-Fee All-In Chequing",
                                         balance: 17562.44),
            AccountSummaryCell.ViewModel(accountType: .creditCard,
                                         accountName: "Visa Avion Card",
                                         balance: 412.83),
            AccountSummaryCell.ViewModel(accountType: .creditCard,
                                         accountName: "Student Mastercard",
                                         balance: 50.83),
            AccountSummaryCell.ViewModel(accountType: .investment,
                                         accountName: "Tax-Free Saver",
                                         balance: 2000.03),
            AccountSummaryCell.ViewModel(accountType: .investment,
                                         accountName: "Growth Fund",
                                         balance: 15000.01)
        ]
    }
}
// MARK: - ACTION
extension AccountSummaryViewController {
    @objc func logoutTapped() {
        NotificationCenter.default.post(name: .logout, object: nil)
    }
}
