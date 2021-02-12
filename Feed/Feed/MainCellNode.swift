//
//  EmptyFollowingCellNode.swift
//  Feed
//
//  Created by constantine on 11.02.2021.
//

import AsyncDisplayKit
import AttributedStringBuilder

class MainCellNode: ASCellNode {
    
    private let titleNode = ASTextNode()
    private let descriptionNode = ASTextNode()
    private let imageNode = ASImageNode()
    private var builder = AttributedStringBuilder()

    override init() {
        super.init()
        
        automaticallyManagesSubnodes = true
        
        imageNode.image = UIImage(named: "im")
        imageNode.contentMode = .scaleAspectFit
        
        builder.text("Президент Евросовета посетит Украину 2-3 марта, планируется поездка на Донбасс", attributes: [
                        .textColor(.black),
                        .font(.boldSystemFont(ofSize: 14)),
                        .alignment(.center)])
        titleNode.attributedText = builder.attributedString
        
        builder = AttributedStringBuilder()
        builder.text("Как сообщает Европейская правда, об этом заявил заместитель руководителя офиса президента Игорь Жовква.", attributes: [
                        .textColor(.darkGray),
                        .font( .boldSystemFont(ofSize: 12)),
                        .alignment(.left)])
        descriptionNode.attributedText = builder.attributedString
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let maxWidth = constrainedSize.max.width
        let imageWidth = maxWidth - 16
        let imageHeight = imageWidth * 0.50
        imageNode.style.maxSize = CGSize(width: imageWidth, height: imageHeight)
        let stack = ASStackLayoutSpec(direction: .vertical, spacing: 16, justifyContent: .center, alignItems: .center, children: [titleNode, imageNode ,descriptionNode])
        let inset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8), child: stack)
        return inset
    }
}
