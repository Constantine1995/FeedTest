//
//  BaseNode.swift
//  Feed
//
//  Created by constantine on 11.02.2021.
//

import AsyncDisplayKit

class BaseNode: ASDisplayNode {
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
}
