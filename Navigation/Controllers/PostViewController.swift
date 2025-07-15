import UIKit

struct PostInfo {
    var title: String
}

class PostViewController: UIViewController {

    var post: PostInfo?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow

        if let postTitle = post?.title {
            title = postTitle
            print("Пост загружен с заголовком:", postTitle)

            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(showInfo))
           }
       }

       @objc func showInfo() {
           let infoVC = InfoViewController()
           present(infoVC, animated:true, completion:nil)
       }
   }


