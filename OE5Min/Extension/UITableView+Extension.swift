//
//  UITableView+Extension.swift
//  函数式Swift
//
//  Created by gaof on 2017/1/6.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit

typealias TargetType = String

let kCellActionType = "cell"


typealias RowAction = (TargetType,Any?,IndexPath?)->Void

protocol OETableViewProtocol {
    
    func cellAction(rowAction:@escaping (TargetType,Any?,IndexPath?)->Void)
}


private var icAssociationKey: UInt8 = 0

private class ClosureWrapper {
    var closure: RowAction?
    
    init(_ closure: RowAction?) {
        self.closure = closure
    }
}

extension UITableView:UITableViewDelegate,OETableViewProtocol {
    
    var rowAction: RowAction? {
        get {
            let wrapper =
                objc_getAssociatedObject(self, &icAssociationKey) as? ClosureWrapper
            return wrapper?.closure
        }
        set(newValue) {
            objc_setAssociatedObject(self,
                                     &icAssociationKey,
                                     ClosureWrapper(newValue),
                                     .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func cellAction(rowAction: @escaping (TargetType, Any?, IndexPath?) -> Void) {
        self.rowAction = rowAction

    }
    
    func cellDidClick(targetType:TargetType,target:Any?,indexPath:IndexPath?){
        rowAction?(targetType,target,indexPath)
    }
    

}

extension UIView {
    
    var tableView:UITableView? {
        var tableView = self.superview
        while !(tableView is UITableView) {
            tableView = tableView?.superview
        }
        return tableView as! UITableView?
    }
    
    var tableViewCell:UITableViewCell? {
        var tableViewCell = self
        while !(tableViewCell is UITableViewCell) {
            tableViewCell = tableViewCell.superview!
        }
        return tableViewCell as? UITableViewCell
    }
    
    var indexPath:IndexPath? {
        if self.tableViewCell != nil {
            return tableView?.indexPath(for: self.tableViewCell!)
        }else{
            return nil
        }
    }
    
    func cellAction<T>(targetType:TargetType,target:T){
        
        self.tableView?.cellDidClick(targetType: targetType, target: target, indexPath: indexPath)
    }
    
}
