import UIKit
import StorageService

class ProfileViewController: UIViewController {

    public let tableView = UITableView()

    public let posts: [Post] = [
        Post(author: "three_cats", description: "Заставка мультфильма 3 кота", image: "3cats", likes: 240, views: 312),
        Post(author: "kompot", description: "Люблю бабочек", image: "kompot", likes: 966, views: 993),
        Post(author: "korzhik", description: "Пираты йо-хо-хо", image: "korzhik", likes: 134, views: 300),
        Post(author: "karamelka", description: "Я знаю, что надо делать!", image: "karamelka", likes: 720, views: 860)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

            #if DEBUG
            view.backgroundColor = .systemGreen
            #else
            view.backgroundColor = .systemRed
            #endif
        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")

        tableView.dataSource = self
        tableView.delegate = self

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300

        tableView.tableHeaderView = createProfileHeaderView()
    }

    private func createProfileHeaderView() -> UIView {
        let headerView = ProfileHeaderView()
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 220)
        return headerView
    }
}

// UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }

        let post = posts[indexPath.row]
        cell.configure(with: post)
        return cell
    }
}

// UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
}
