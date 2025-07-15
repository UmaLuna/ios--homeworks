import UIKit
import StorageService

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let button = UIButton(type: .system)
        button.setTitle("Перейти к посту", for: .normal)
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func showPost() {
        let postVC = PostViewController()

        let post = PostInfo(title: "Заголовок поста")

        postVC.post = post

        navigationController?.pushViewController(postVC, animated: true)
    }
}

