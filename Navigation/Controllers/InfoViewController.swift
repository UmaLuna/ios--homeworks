//
//  InfoViewController.swift
//  Navigation
//
//  Created by Ума Ильясова on 22.04.2025.
//

import UIKit

class InfoViewController : UIViewController {

   override func viewDidLoad() {
       super.viewDidLoad()

       view.backgroundColor = .white

       let button = UIButton(type:.system)

       button.setTitle("Показать сообщение", for:.normal)

       button.addTarget(self, action:#selector(showAlert), for:.touchUpInside)

       button.translatesAutoresizingMaskIntoConstraints=false

       view.addSubview(button)

       NSLayoutConstraint.activate([button.centerXAnchor.constraint(equalTo:view.centerXAnchor),

                                    button.centerYAnchor.constraint(equalTo:view.centerYAnchor)])
   }

   @objc func showAlert() {
       let alert = UIAlertController(title:"Заголовок",
                                    message:"Сообщение",
                                    preferredStyle:.alert)

       alert.addAction(UIAlertAction(title:"OK", style:.default) { _ in
           print("OK нажато")
       })

       alert.addAction(UIAlertAction(title:"Отмена", style:.cancel) { _ in
           print("Отмена нажата")
       })

       present(alert, animated:true)
   }
}
