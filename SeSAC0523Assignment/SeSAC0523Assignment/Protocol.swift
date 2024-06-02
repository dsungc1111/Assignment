//
//  Protocol.swift
//  SeSAC0523Assignment
//
//  Created by 최대성 on 6/1/24.
//

import UIKit

protocol UserIdentifier {
    static var identifier: String { get }
}

extension UITableViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

