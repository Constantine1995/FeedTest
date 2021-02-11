//
//  ViewController.swift
//  Feed
//
//  Created by constantine on 11.02.2021.
//

import UIKit
import AsyncDisplayKit

class ViewController: ASDKViewController<BaseNode> {
    
    override init() {
        super.init(node: BaseNode())
        self.node.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

