//
//  GroupsViewController.swift
//  HW7
//
//  Created by Eugene Zvyagin on 17.07.2023.
//

import UIKit

final class GroupsViewController: UITableViewController {
    private let networkService = NetworkService()
    private var models: [Group] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Groups"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        tableView.register(GroupCell.self, forCellReuseIdentifier: "GroupCell")
        networkService.getGroups { [weak self] groups in
            self?.models = groups
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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else {
            return UITableViewCell()
        }
        let model = models[indexPath.row]
        cell.updateCell(model: model)
        return cell
    }
}
