
//
//  ViewController.swift
//  SwiftHelper
//
//

import UIKit

public protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    public static var reuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    static func reusableNib() -> UINib {
        let bundle = Bundle(for: classForCoder())
        return UINib(nibName: reuseIdentifier, bundle: bundle)
    }
}

// MARK: - UITableView
public extension ReusableView where Self: UITableViewCell {
    static func registerCell(with tableView: UITableView) {
        tableView.register(Self.classForCoder(), forCellReuseIdentifier: reuseIdentifier)
    }

    static func registerNib(with tableView: UITableView) {
        tableView.register(reusableNib(), forCellReuseIdentifier: reuseIdentifier)
    }

    static func reusableCell(from tableView: UITableView, for indexPath: IndexPath) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? Self else {
            fatalError("Could not dequeue reusable view for '\(reuseIdentifier)'.")
        }

        return cell
    }
}

// MARK: - UICollectionView
public extension ReusableView where Self: UICollectionViewCell {
    static func registerCell(with collectionView: UICollectionView) {
        collectionView.register(Self.classForCoder(), forCellWithReuseIdentifier: reuseIdentifier)
    }

    static func registerNib(with collectionView: UICollectionView) {
        collectionView.register(reusableNib(), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    static func reusableCell(from collectionView: UICollectionView, for indexPath: IndexPath) -> Self {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? Self else {
            fatalError("Could not dequeue reusable view for '\(reuseIdentifier)'.")
        }

        return cell
    }
}

public extension ReusableView where Self: UICollectionReusableView {
    static func registerNib(with collectionView: UICollectionView) {
        collectionView.register(reusableNib(), forCellWithReuseIdentifier: reuseIdentifier)
    }

    static func reusableView(from collectionView: UICollectionView, kind: String, for indexPath: IndexPath) -> Self {
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifier, for: indexPath) as? Self else {
            fatalError("Could not dequeue reusable view for '\(reuseIdentifier)'.")
        }

        return cell
    }
}


extension UITableViewCell: ReusableView {}
extension UICollectionReusableView: ReusableView {}
