//
//  Protocol.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/31/24.
//

import UIKit

protocol IdentifierProtocol {
    
    static var identifier: String { get }
}

extension UIViewController: IdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: IdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}


