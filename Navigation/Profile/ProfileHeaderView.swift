import UIKit
import StorageService

class ProfileHeaderView: UIView {

    private var statusText: String = ""

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat")
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Caramel Cat"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите статус"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)

        button.layer.cornerRadius = 10
        button.clipsToBounds = true

        button.layer.shadowOpacity = 0

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray

        setupSubviews()
        setupConstraints()
        setupTargets()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupSubviews() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
    }

    private func setupTargets() {
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }

    @objc private func buttonPressed() {
        statusLabel.text = statusText.isEmpty ? "Статус пустой" : statusText
    }

     private func setupConstraints() {
     NSLayoutConstraint.activate([
     avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
     avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
     avatarImageView.widthAnchor.constraint(equalToConstant: 100),
     avatarImageView.heightAnchor.constraint(equalToConstant: 100),

     fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
     fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),

     statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10),
     statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),

     statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
     statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
     statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
     statusTextField.heightAnchor.constraint(equalToConstant: 40),

     setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 10),
     setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
     setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
     setStatusButton.heightAnchor.constraint(equalToConstant: 40)
     ])
     }
     }
