//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import IBAnimatable
import ReactiveCocoa


let a = 10
let b = 20
print(a+b)


class tableViewController:UIViewController{
    
    let tableView = UITableView(frame: CGRect.init(x: 10, y: 200, width: 200, height: 200), style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
//        self.view.addSubview(tableView)
        let btn = UIButton(frame: CGRect(x: 20 ,y: 20, width: 44, height: 44))
        btn.setTitle("test", for: .normal)
        self.view.addSubview(btn)
        btn.reactive.trigger(for: .touchUpInside)
    }
    

    

}
extension tableViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.tableView.frame.size.height = 400
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    print(cell.layer.bounds.origin.y)
        let animation = CABasicAnimation()
        animation.keyPath = "bounds.origin.y"
        animation.fromValue = -200
        animation.toValue = 0
        animation.duration = 2
        cell.layer.add(animation, forKey: "basic")        
        
    }
}


let iPhoneWidth = 375
let iPhoneHeight = 667
let iPhoneView = UIView(frame: CGRect(x: 0, y: 0, width: iPhoneWidth, height: iPhoneHeight))
iPhoneView.backgroundColor = #colorLiteral(red: 0.579431951, green: 0.9811758399, blue: 0.3627964258, alpha: 1)

PlaygroundPage.current.liveView = iPhoneView
PlaygroundPage.current.needsIndefiniteExecution = true
let vc = tableViewController()
iPhoneView.addSubview(vc.view)

