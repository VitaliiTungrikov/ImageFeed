//
//  ViewController.swift
//  ImageFeed
//
//  Created by admin on 24.01.2024.
//

import UIKit

class ImagesListViewController: UIViewController {

    func configCell(for cell: ImagesListCell) { }

    @IBOutlet private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath) // 1

            guard let imageListCell = cell as? ImagesListCell else { // 2
                return UITableViewCell()
            }

            configCell(for: imageListCell) // 3
            return imageListCell // 4
        }
}

extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
