//
//  ViewController.swift
//  Feed
//
//  Created by constantine on 11.02.2021.
//

import UIKit
import AsyncDisplayKit

class ViewController: ASDKViewController<BaseNode> {

    var collectionNode: ASCollectionNode!

    override init() {
        super.init(node: BaseNode())
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateFrame() {
        guard collectionNode.frame.size != itemSize else { return }
        collectionNode.frame = CGRect(origin: .zero, size: itemSize)
    }
}

private extension ViewController {
    func setupUI() {
        setupCollectionNode()
    }
    
    func setupCollectionNode() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        layout.scrollDirection = .horizontal
        layout.itemSize = itemSize
        
        collectionNode = ASCollectionNode(collectionViewLayout: layout)
        collectionNode.showsHorizontalScrollIndicator = false
        collectionNode.dataSource = self
        collectionNode.delegate = self
        collectionNode.view.showsHorizontalScrollIndicator = false
        collectionNode.view.decelerationRate = .fast
        collectionNode.view.bounces = false
        view.addSubnode(collectionNode)
        updateFrame()
    }
    
    var itemSize: CGSize {
        let screenSize = UIScreen.main.bounds.size
        return CGSize(width: screenSize.width, height: screenSize.height)
    }
}

// MARK: - ASCollectionDataSource
extension ViewController: ASCollectionDataSource {
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellNodeBlock = { () -> ASCellNode in
            let cellNode = FeedCellNode()
            return cellNode
        }
        return cellNodeBlock
    }
}

// MARK: - ASCollectionDelegate
extension ViewController: ASCollectionDelegate {
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        return ASSizeRange(min: itemSize, max: itemSize)
    }
}
