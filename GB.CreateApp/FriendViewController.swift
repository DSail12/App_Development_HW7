//
//  FriendViewController.swift
//  HW7
//
//  Created by Eugene Zvyagin on 17.07.2023.
//


import UIKit

final class FriendViewController: UITableViewController {
    private let networkService = NetworkService()
    private var models: [Friend] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Переход", style: .plain, target: self, action: #selector(tap))
        tableView.register(FriendCell.self, forCellReuseIdentifier: "FriendCell")
        networkService.getFriends { [weak self] friends in
            self?.models = friends
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateTransition()
    }
    private func animateTransition() {
        tableView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        tableView.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
            self.tableView.transform = .identity
            self.tableView.alpha = 1.0
        }, completion: nil)
    }
    func showFriendProfile(_ friend: Friend) {
        let profileViewController = ProfileFriendViewController()
        profileViewController.friend = friend
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else {
            return UITableViewCell()
        }
        let model = models[indexPath.row]
        cell.updateCell(model: model)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friend = models[indexPath.row]
        let alertController = UIAlertController(title: "Переход на профиль", message: "Вы выбрали друга \((friend.firstName ?? "") + " " + (friend.lastName ?? "") )", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            self?.showFriendProfile(friend)
        }))
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
        let profileViewController = ProfileFriendViewController()
        profileViewController.friend = friend
        navigationController?.pushViewController(profileViewController, animated: true)
    }
}
private extension FriendViewController {
    @objc func tap() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.type = .moveIn
        animation.duration = 3
        navigationController?.pushViewController(ProfileViewController(), animated: false)
    }
}
