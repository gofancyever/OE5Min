//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import RxSwift
import RxCocoa

let iPhoneView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
iPhoneView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
PlaygroundPage.current.liveView = iPhoneView

let button = UIButton(frame: CGRect(x: 20, y: 20, width: 40, height: 40))
button.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
iPhoneView.addSubview(button)

let subject = PublishSubject<UIButton>()
class Receiver {
    @objc func buttonClicked(sender:UIButton) {
        subject.onNext(sender)
    }
}


let receiver = Receiver()
button.setTitle("TestButton", for: .normal)
button.setTitleColor(#colorLiteral(red: 0.474509805440903, green: 0.839215695858002, blue: 0.976470589637756, alpha: 1.0), for: .normal)
button.addTarget(receiver, action: #selector(Receiver.buttonClicked(sender:)), for: .touchUpInside)
iPhoneView.addSubview(button)


button.rx.tap.subscribe { (even) in
    print("click")
}

subject.subscribe { (button) in
    print(button)
}
