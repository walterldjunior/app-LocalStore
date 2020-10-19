//
//  HomeCollectionViewController.swift
//  app-LocalStore
//
//  Created by Walter Luis Deonísio Junior on 18/10/20.
//

import UIKit

class HomeCollectionViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    var viewModel = HomeViewModel()
    var imageLocation = ImageLocation.allPhotos()
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectioView()
        viewModel.fetchListLocations()
        
        viewModel.listLocationsDidUpdate = listLocationsDidUpdate
        self.collectionView!.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    
    // MARK: - Functions
    func setupCollectioView() {
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
    }
    
    func listLocationsDidUpdate() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.collectionView.refreshControl?.endRefreshing()
        }
    }
    
    func showContentController() {
        let contentViewController = DetailStoreViewController()
        let navBar = UINavigationController(rootViewController: contentViewController)
        navBar.modalPresentationStyle = .formSheet
        self.present(navBar, animated: true, completion: nil)
    }
    
    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        cell.location = viewModel.listLocations[indexPath.item]
        cell.photo = imageLocation[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2.2, height: imageLocation[indexPath.item].image.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 10, bottom: 10, right: 10)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showContentController()
    }
    
    func collectionView(_ collectionView: UICollectionView, sizeOfPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return imageLocation[indexPath.item].image.size.height
    }
}
        
