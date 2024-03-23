//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by admin on 12.02.2024.
//

import Foundation
import UIKit

final class ImagesListCell: UITableViewCell {
    
    static let reuseIdentifier = "ImagesListCell"
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    func configCell(with image: UIImage?, date: Date, isLiked: Bool) {
        if let image = image {
            print("Setting image in cell: \(image)")
            cellImage.image = image
        }
        dateLabel.text = dateFormatter.string(from: date)
        dateLabel.adjustsFontSizeToFitWidth = true
        
        let likeImage = isLiked ? UIImage(named: "like_button_on") : UIImage(named: "like_button_off")
        likeButton.setImage(likeImage, for: .normal)
    }
}

