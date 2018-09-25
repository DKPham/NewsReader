//
//  PublisherCollectionViewCell.swift
//  NewsReader
//
//   Created by Duy Pham on 9/1/16.
//

import UIKit

class PublisherCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var publisherImageView: UIImageView!
    @IBOutlet weak var publisherTitleLabel: UILabel!
    
    var publisher: Publisher! {
        didSet {
            self.publisherImageView.image = publisher.image
            publisherTitleLabel.text = publisher.title
            
            self.layer.cornerRadius = 3.0
            self.layer.masksToBounds = true
        }
    }
}


















