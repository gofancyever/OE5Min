//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import RxSwift

func initTestRx() {
    /*
     let myJust = { (singleElement:Int) -> Observable<Int> in
     return Observable.create({ (observer) -> Disposable in
     observer.onNext(singleElement)
     observer.onCompleted()
     return  Disposables.create()
     })
     
     }
     _ = myJust(5).subscribe({ (event) in
     print(event)
     })
     */
    let deferredSequence:Observable<Int> = Observable.deferred { () -> Observable<Int> in
        return Observable.create({ (observer) -> Disposable in
            observer.onNext(0)
            observer.onNext(1)
            observer.onNext(2)
            return Disposables.create()
        })
    }
    _ = deferredSequence.subscribe({ (event) in
        print(event)
    })
    _ = deferredSequence.subscribe({ (event) in
        print(event)
    })
}

//initTestRx()

let repeatElementSequence = Observable.repeatElement(1)

_ = repeatElementSequence.subscribe { event in
    print(event)
}