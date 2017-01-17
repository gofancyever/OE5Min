//
//  OEWeiboDetailController.swift
//  OE5Min
//
//  Created by gaof on 2017/1/10.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit

class OEWeiboDetailController: OEBaseTableViewController {

    let edgePanGesture = UIScreenEdgePanGestureRecognizer()
    var navigationDelegate: OENavigationDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgePanGesture.edges = .left
        edgePanGesture.addTarget(self, action: #selector(self.handleEdgePanGesture(gesture:)))
        view.addGestureRecognizer(edgePanGesture)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleEdgePanGesture(gesture: UIScreenEdgePanGestureRecognizer){
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
    
    deinit{
        edgePanGesture.removeTarget(self, action: #selector(self.handleEdgePanGesture(gesture:)))
    }


}
//extension OEWeiboDetailController:OEMoveInverseProtocol {
//    
//}
