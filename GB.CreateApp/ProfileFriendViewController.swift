//
//  ProfileFriendViewController.swift
//  HW7
//
//  Created by Eugene Zvyagin on 17.07.2023.
//

import UIKit

final class ProfileFriendViewController: UIViewController {
    var friend: Friend?
    private var networkService = NetworkService()
    private var profileImageView = UIImageView()
    private var nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        title = "Profile of Friend"
        networkService.getProfileInfo { [weak self] user in
            self?.updateData(user: user)
        }
    }
    func updateData(user: User?) {
        guard let friend = friend else { return }
        DispatchQueue.global().async {
            if let url = URL(string: friend.photo ?? ""), let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.profileImageView.image = UIImage(data: data)
                }
            }
        }
        DispatchQueue.main.async {
            self.nameLabel.text = (friend.firstName ?? "") + " " + (friend.lastName ?? "")
        }
    }
    private func setupViews() {
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        setupConstraints()
    }
    private func setupConstraints() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            profileImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30)
        ])
    }
}
