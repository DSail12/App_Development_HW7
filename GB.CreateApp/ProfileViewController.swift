//
//  ProfileViewController.swift
//  HW7
//
//  Created by Eugene Zvyagin on 17.07.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    private var button1 = CustomButton(text: "Тема красная", backgroundColor: RedTheme().backgroundColor)
    private var button2 = CustomButton(text: "Тема синяя", backgroundColor: BlueTheme().backgroundColor)
    private var button3 = CustomButton(text: "Тема зеленая", backgroundColor: GreenTheme().backgroundColor)
    private var button4 = CustomButton(text: "Возврат прежних настроек", backgroundColor: WhiteTheme().backgroundColor)
    private var networkService = NetworkService()
    private var profileImageView = UIImageView()
    private var nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = 10.0
        label.layer.masksToBounds = true
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ThemeManager.currentTheme.backgroundColor
        button1.addTarget(self, action: #selector(tap1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(tap2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(tap3), for: .touchUpInside)
        button4.addTarget(self, action: #selector(tap4), for: .touchUpInside)
        setupViews()
        title = "Profile"
        networkService.getProfileInfo { [weak self] user in
            self?.updateData(user: user)
        }
    }
    func updateData(user: User?) {
        guard let user = user else { return }
        DispatchQueue.global().async {
            if let url = URL(string: user.photo ?? ""), let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.profileImageView.image = UIImage(data: data)
                }
            }
        }
        DispatchQueue.main.async {
            self.nameLabel.text = (user.firstName ?? "") + " " + (user.lastName ?? "")
        }
    }
    private func setupViews() {
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
        setupConstraints()
    }
    private func setupConstraints() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        button4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            profileImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30),
            button1.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            button4.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 20),
            button4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
}
private extension ProfileViewController {
    @objc func tap1() {
        ThemeManager.currentTheme = RedTheme()
        view.backgroundColor = ThemeManager.currentTheme.backgroundColor
    }
    @objc func tap2() {
        ThemeManager.currentTheme = BlueTheme()
        view.backgroundColor = ThemeManager.currentTheme.backgroundColor
    }
    @objc func tap3() {
        ThemeManager.currentTheme = GreenTheme()
        view.backgroundColor = ThemeManager.currentTheme.backgroundColor
    }
    @objc func tap4() {
        ThemeManager.currentTheme = WhiteTheme()
        view.backgroundColor = ThemeManager.currentTheme.backgroundColor
    }
}
