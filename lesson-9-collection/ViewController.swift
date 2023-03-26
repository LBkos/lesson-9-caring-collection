//
//  ViewController.swift
//  lesson-9-collection
//
//  Created by Константин Лопаткин on 26.03.2023.
//

import UIKit


class ViewController: UIViewController {
    let layout: UICollectionViewFlowLayout = CellFlowLayout()
    var collectionView: UICollectionView!
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
                
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 0)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.itemSize = CGSize(width: view.frame.size.width - 40, height: view.frame.size.height / 2)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView.layoutMargins = .init(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        

        view.addSubview(collectionView)
        title = "Collection"
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.layer.backgroundColor = UIColor.systemGray4.cgColor
        myCell.layer.cornerRadius = 16
        return myCell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }
}
