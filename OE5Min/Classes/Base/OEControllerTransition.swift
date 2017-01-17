//
//  ControllerTransition.swift
//  testCellAntimation
//
//  Created by gaof on 2017/1/9.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit

//enum OETransitionType{
//    case NavigationTransition(UINavigationControllerOperation)
//}

class OEControllerTransition: NSObject,UIViewControllerAnimatedTransitioning {
    
    private var transitionType: UINavigationControllerOperation
    
    init(type: UINavigationControllerOperation) {
        transitionType = type
        super.init()
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView
        var snapshotView:UIView?
        if self.transitionType == .push {
            //1获取动画的源控制器和目标控制器
            
            let fromVC = transitionContext.viewController(forKey: .from) as! OEBaseTableViewController
            let toVC = transitionContext.viewController(forKey: .to) as! OEBaseTableViewController
            
            
            //2 创建一个cell钟的imageview的截图并把imageview隐藏 造成使用户以为移动的就是 imageView 的假象
            snapshotView = fromVC.moveView?.snapshotView(afterScreenUpdates: false)
            snapshotView?.frame  = container.convert((fromVC.moveView?.frame)!, from: fromVC.moveView?.superview)
            fromVC.moveView?.isHidden = true
            
            //3 设置目标目标控制器的位置 ，并把透明底设为0 在后面的动画慢慢显示出来变为1
            toVC.view.frame = transitionContext.finalFrame(for: toVC)
            toVC.view.alpha = 0
            
            toVC.tableView.frame.origin.x = container.frame.width
            
            //4都添加到container中 顺序不能错
            container.addSubview(toVC.view)
            container.addSubview(snapshotView!)
            
            //5 执行动画
            /*
             这时avatarImageView.frame的值只是跟在IB中一样的，
             如果换成屏幕尺寸不同的模拟器运行时avatarImageView会先移动到IB中的frame,动画结束后才会突然变成正确的frame。
             所以需要在动画执行前执行一次toVC.avatarImageView.layoutIfNeeded() update一次frame
             */
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                container.layoutIfNeeded()
                let rect = container.convert((toVC.toView?.frame)!, from: toVC.toView?.superview)
//                fromVC.finalCellRect = rect
                snapshotView?.frame = rect
                toVC.view.alpha = 1
                
                
                
            }, completion: { (fininsh) in
                fromVC.moveView?.isHidden = false
                snapshotView?.removeFromSuperview()
                //一定要记得动画完成后执行此方法，让系统管理 navigation
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        }
            //返回动画
        else {
            //1获取动画的源控制器和目标控制器
            let fromVC = transitionContext.viewController(forKey: .from) as! OEBaseTableViewController
            let toVC = transitionContext.viewController(forKey: .to) as! OEBaseTableViewController
            
            snapshotView = fromVC.toView?.snapshotView(afterScreenUpdates: false)
            snapshotView?.backgroundColor = UIColor.clear
            snapshotView?.frame = container.convert((fromVC.toView?.frame)!, from: fromVC.toView?.superview)
            fromVC.toView?.isHidden = true
            
            //初始化后一个VC的位置
            toVC.view.frame = transitionContext.finalFrame(for: toVC)
            //获取toVC中图片的位置
            toVC.moveView?.alpha = 0
            print(toVC.moveView)
            let finalRect = container.convert((toVC.moveView?.frame)!, from: toVC.moveView?.superview)
            print(finalRect)
            
            container.insertSubview(toVC.view, belowSubview: fromVC.view)
            container.addSubview(snapshotView!)
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                fromVC.view.alpha = 0
                snapshotView?.frame = finalRect
            }, completion: { (finish) in
                snapshotView?.removeFromSuperview()
                fromVC.toView?.isHidden = false
                toVC.moveView?.alpha = 1
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
            
        }
    }
    
    
}

