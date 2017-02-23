//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import RxSwift
import RxCocoa
import SnapKit
//let iPhoneView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
//iPhoneView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//PlaygroundPage.current.liveView = iPhoneView
//
//let stackView = UIStackView()
//iPhoneView.addSubview(stackView)
//stackView.frame = CGRect(x: 0, y: 0, width: 320, height: 40)
//
//stackView.distribution = .equalSpacing
//stackView.axis = .horizontal
//
//let view1 = UIView()
//view1.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
//
//let view2 = UIView()
//view1.backgroundColor = #colorLiteral(red: 0.4078193307, green: 0.4078193307, blue: 0.4078193307, alpha: 1)
//
//stackView.addArrangedSubview(view1)
//stackView.addArrangedSubview(view2)

struct user {
    var name:String?
    var ago:Int?
}
let user1 = user(name: "a",ago: 12)
let user2 = user(name: "b", ago: 14)

var array  = [user1,user2];

let index = array.index { (user) -> Bool in
    return user.name == user2.name
}

print(index)

array.remove(at: index!)
print(array)




