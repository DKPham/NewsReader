//
//  PublishersCollectionViewController.swift
//  NewsReader
//
//  Created by Duy Pham on 9/1/16.
//

import UIKit
import SafariServices

class PublishersCollectionViewController: UICollectionViewController
{
    var store = PublishersStore()
    
    struct Storyboard {
        static let publisherCell = "PublisherCell"
        static let sectionHeader = "SectionHeader"
        
        static let leftAndRightPaddings: CGFloat = 32.0 // 3 items per row, meaning 4 paddings of 8 each
        static let numberOfItemsPerRow: CGFloat = 3.0
        static let titleHeightAdjustment: CGFloat = 30.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionViewWidth = collectionView?.frame.width
        let itemWidth = (collectionViewWidth! - Storyboard.leftAndRightPaddings) / Storyboard.numberOfItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth + Storyboard.titleHeightAdjustment)
    }

    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return store.numberOfSections
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return store.numberOfPublishers(inSection: section)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.publisherCell, for: indexPath) as! PublisherCollectionViewCell
        let publisher = store.publisherForItem(atIndexPath: indexPath)
    
        cell.publisher = publisher
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.sectionHeader, for: indexPath) as! SectionHeaderCollectionReusableView
        
        if let publisher = store.publisherForItem(atIndexPath: indexPath) {
            headerView.publisher = publisher
        }
        
        return headerView
    }
    
    //MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let publisher = store.publisherForItem(atIndexPath: indexPath)
        if let url = publisher?.url {
            let safariVC = SFSafariViewController(url: URL(string: url)!)
            self.present(safariVC, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Oooops!", message: "This publisher doesn't provide a website", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
     }

}
















