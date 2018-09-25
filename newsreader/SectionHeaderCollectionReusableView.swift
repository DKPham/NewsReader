//
//  SectionHeaderCollectionReusableView.swift
//  NewsReader
//
//   Created by Duy Pham on 9/1/16.
//

import UIKit

class SectionHeaderCollectionReusableView: UICollectionReusableView
{
    @IBOutlet weak var sectionTitleLabel: UILabel!
    
    var publisher: Publisher! {
        didSet {
            sectionTitleLabel.text = publisher.section.uppercased()
        }
    }
    
}













