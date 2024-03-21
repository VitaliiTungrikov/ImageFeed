import UIKit

final class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfile()
    }

    private func setupProfile() {
        view.backgroundColor = .black

        // Создаем аватар пользователя
        let avatarImageView = UIImageView(image: UIImage(named: "Avatar"))
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.tintColor = .gray
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatarImageView)

        // Создаем имя пользователя
        let nameLabel = UILabel()
        nameLabel.text = "Екатерина Новикова"
        nameLabel.font = UIFont(name: "SFPro-Bold", size: 23)
        nameLabel.textAlignment = .left
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.5
        nameLabel.numberOfLines = 1
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)

        // Создаем строку для электронной почты
        let emailLabel = UILabel()
        emailLabel.text = "@ekaterina_nov"
        emailLabel.font = UIFont(name: "SFPro", size: 13)
        emailLabel.textColor = .white
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailLabel)

        // Создаем описание профиля
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Hello, world!"
        descriptionLabel.font = UIFont(name: "SFPro", size: 13)
        descriptionLabel.textColor = .white
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.numberOfLines = 0
        view.addSubview(descriptionLabel)

        // Создаем кнопку
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ipad.and.arrow.forward"), for: .normal)
        button.tintColor = UIColor(hex: "F56B6C")
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)


        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            avatarImageView.widthAnchor.constraint(equalToConstant: 70),
            avatarImageView.heightAnchor.constraint(equalToConstant: 70),

            nameLabel.widthAnchor.constraint(equalToConstant: 235),
            nameLabel.heightAnchor.constraint(equalToConstant: 18),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),

            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            emailLabel.widthAnchor.constraint(equalToConstant: 99),
            emailLabel.heightAnchor.constraint(equalToConstant: 18),
            emailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            emailLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 156),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),


            descriptionLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),

            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            button.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor)
        ])
    }

    @objc
    private func didTapButton() {
        for view in view.subviews {
            if view is UILabel {
                view.removeFromSuperview()
            }
        }
    }
}

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        var rgb: UInt64 = 0

        if hexSanitized.hasPrefix("#") {
            hexSanitized = String(hexSanitized.dropFirst())
        }

        guard hexSanitized.count == 6 else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgb & 0x0000FF) / 255.0,
                  alpha: 1)
    }
}

