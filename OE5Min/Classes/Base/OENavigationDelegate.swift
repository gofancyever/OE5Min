//
//  OENavigationDelegate.swift
//  testCellAntimation
//
//  Created by gaof on 2017/1/10.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit


protocol OEMoveInverseProtocol {
    var moveInverseImages:[String]? {get set}
    var navigationDelegate: OENavigationDelegate? {get set}
    var edgePanGesture:UIScreenEdgePanGestureRecognizer {get set}
    func handleEdgePanGesture(gesture: UIScreenEdgePanGestureRecognizer)
}

class OENavigationDelegate: NSObject,UINavigationControllerDelegate {
    var interactive = false
    let interactionController = UIPercentDrivenInteractiveTransition()
//    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        
//        return OEControllerTransition(type: operation)
//    }
//    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactive ? self.interactionController : nil
    }

}

extension OEMoveInverseProtocol where Self:OEBaseTableViewController {

    mutating func handleEdgePanGesture(gesture: UIScreenEdgePanGestureRecognizer) {
        let translationX =  gesture.translation(in: view).x
        let translationBase: CGFloat = view.frame.width / 3
        let translationAbs = translationX > 0 ? translationX : -translationX
        let percent = translationAbs > translationBase ? 1.0 : translationAbs / translationBase
        switch gesture.state{
        case .began:
            navigationDelegate = self.navigationController?.delegate as? OENavigationDelegate
            navigationDelegate?.interactive = true
            self.navigationController?.popViewController(animated: true)
        case .changed:
            navigationDelegate?.interactionController.update(percent)
        case .cancelled, .ended:
            if percent > 0.5{
                navigationDelegate?.interactionController.finish()
            }else{
                navigationDelegate?.interactionController.cancel()
            }
            navigationDelegate?.interactive = false
        default: break
        }
    }
}
