//
//  FeedCellNode.swift
//  Feed
//
//  Created by constantine on 11.02.2021.
//

import AsyncDisplayKit

class FeedCellNode: ASCellNode {
    
    weak var refreshControl: UIRefreshControl?
    private weak var activityIndicator: UIActivityIndicatorView?
    private var collectionNode = ASCollectionNode(collectionViewLayout: UICollectionViewFlowLayout())
    private var openedGroupPosts: [String] = []
    
    override init() {
        super.init()
        
        backgroundColor = .gray
        collectionNode.backgroundColor = .white
        collectionNode.alwaysBounceVertical = true
        
        collectionNode.delegate = self
        collectionNode.dataSource = self
        addSubnode(collectionNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return collectionNode.absolutSpec(constrainedSize.max)
    }
    
    override func didLoad() {
        super.didLoad()
        collectionNode.view.showsVerticalScrollIndicator = false
    }
    
    func nodeBlockForItemAt(_ indexPath: IndexPath) -> ASCellNodeBlock? {
        let cellNodeBlock = { () -> ASCellNode in
            let cellNode = MainCellNode()
            return cellNode
        }
        return cellNodeBlock
    }
}

// MARK: - ASCollectionDataSource
extension FeedCellNode: ASCollectionDataSource {
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellNodeBlock = { () -> ASCellNode in
            let cellNode = ASCellNode()
            return cellNode
        }
        if let block = nodeBlockForItemAt(indexPath) {
            return block
        } else {
            return cellNodeBlock
        }
    }
}

// MARK: - ASCollectionDelegate
extension FeedCellNode: ASCollectionDelegate {
    func collectionNode(_ collectionNode: ASCollectionNode, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, willDisplayItemWith node: ASCellNode) {
    }
    
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return true
    }
}
