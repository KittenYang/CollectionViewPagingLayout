//
//  TransformPageViewProtocol.swift
//  CollectionViewPagingLayout
//
//  Created by Amir on 28/03/2021.
//  Copyright © 2021 Amir Khorsandi. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public protocol TransformPageViewProtocol {
    associatedtype ValueType
    associatedtype ID: Hashable
    associatedtype PageContent: View

    typealias Builder = PagingCollectionViewControllerBuilder<ValueType, ID, PageContent>
    
    var builder: Builder { get }
}


@available(iOS 13.0, *)
public extension TransformPageViewProtocol {
    func numberOfVisibleItems(_ count: Int) -> Self {
        self.builder.modifierData.numberOfVisibleItems = count
        return self
    }

    func zPosition(_ zPosition: @escaping (CGFloat) -> Int) -> Self {
        self.builder.modifierData.zPositionProvider = zPosition
        return self
    }
}


@available(iOS 13.0, *)
public extension TransformPageViewProtocol where Self: UIViewControllerRepresentable {
     func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> Builder.ViewController {
        builder.make()
    }

    func updateUIViewController(_ uiViewController: Builder.ViewController, context: Context) {
        builder.update(viewController: uiViewController)
    }
}
