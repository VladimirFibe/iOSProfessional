import UIKit

class AccountSummaryCell: UITableViewCell {
    
    enum AccountType: String {
        case banking = "Banking"
        case creditCard = "CreditCard"
        case investment = "Investment"
    }
    
    struct ViewModel {
        let accountType: AccountType
        let accountName: String
        let balance: Decimal
        var balanceAsAttributedString: NSAttributedString {
            CurrencyFormatter().makeAttributedCurrency(balance)
        }
    }
    let viewmodel: ViewModel? = nil
    static let reuseIdentifier = "AccountSummaryCell"
    static let rowHeight: CGFloat = 112
    
    let typeLabel: UILabel = {
        $0.font = .preferredFont(forTextStyle: .caption1)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.adjustsFontForContentSizeCategory = true
        return $0
    }(UILabel())
    
    let underlineView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .appColor
        return $0
    }(UIView())
    
    let nameLabel: UILabel = {
        $0.font = .preferredFont(forTextStyle: .body)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.adjustsFontForContentSizeCategory = true
        return $0
    }(UILabel())
    
    let balanceLabel: UILabel = {
        $0.font = .preferredFont(forTextStyle: .body)
        $0.adjustsFontSizeToFitWidth = true
        $0.textAlignment = .right
        return $0
    }(UILabel())
    
    lazy var balanceAmountLabel: UILabel = {
        $0.textAlignment = .right
        return $0
    }(UILabel())
    
    lazy var balanceStackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView(arrangedSubviews: [balanceLabel, balanceAmountLabel]))
    
    let chevronImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "chevron.right")?.withTintColor(.appColor, renderingMode: .alwaysOriginal)
        return $0
    }(UIImageView())
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setuConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryCell {
    private func setupViews() {
        contentView.addSubview(typeLabel)
        contentView.addSubview(underlineView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(balanceStackView)
        contentView.addSubview(chevronImageView)
    }
    private func setuConstraints() {
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            underlineView.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            underlineView.widthAnchor.constraint(equalTo: typeLabel.widthAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 4),
            
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            
            balanceStackView.topAnchor.constraint(equalTo: underlineView.bottomAnchor),
            balanceStackView.leadingAnchor.constraint(
                equalToSystemSpacingAfter: nameLabel.trailingAnchor, multiplier: 4),
            chevronImageView.leadingAnchor.constraint(
                equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 1),
            
            chevronImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contentView.trailingAnchor.constraint(
                equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1)
        ])
    }
}

extension AccountSummaryCell {
    func configure(with viewmodel: ViewModel) {
        typeLabel.text = viewmodel.accountType.rawValue
        nameLabel.text = viewmodel.accountName
        balanceAmountLabel.attributedText = viewmodel.balanceAsAttributedString
        
        switch viewmodel.accountType {
        case .banking:
            underlineView.backgroundColor = .appColor
            balanceLabel.text = "Current balance"
        case .creditCard:
            underlineView.backgroundColor = .systemOrange
            balanceLabel.text = "Balance"
        case .investment:
            underlineView.backgroundColor = .systemPurple
            balanceLabel.text = "Value"
        }
    }
}
