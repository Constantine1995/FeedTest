//
//  ASDK+Extension.swift
//  Feed
//
//  Created by constantine on 11.02.2021.
//

import AsyncDisplayKit

extension ASDisplayNode {
    func absolutSpec(_ maxWidth: CGFloat) -> ASLayoutSpec {
        let absolut = ASAbsoluteLayoutSpec(children: [self])
        absolut.style.width = ASDimensionMake(maxWidth)
        return absolut
    }
    
    func absolutSpec(_ maxSize: CGSize) -> ASLayoutSpec {
        let absolut = ASAbsoluteLayoutSpec(children: [self])
        absolut.style.maxSize = maxSize
        return absolut
    }
}
