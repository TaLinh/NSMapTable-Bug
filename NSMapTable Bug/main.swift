//
//  main.swift
//  NSMapTable Bug
//
//  Created by Linh Ta on 13/05/2022.
//

import Foundation

class DelegateCollection<T> {
    let delegates = NSHashTable<AnyObject>.weakObjects()

    func add(_ delegate: T) {
        delegates.add(delegate as AnyObject)
    }

    func trigger(_ action: (T) -> Void) {
        for case let object as T in delegates.allObjects {
            action(object)
        }
    }
}

protocol Test {
    var name: String { get }
    func sayHi()
}

extension Test {
    func sayHi() {
        print(name)
    }
}

struct ValHuman: Test {
    let name: String
}

class RefHuman: Test {
    let name: String

    init(name: String) {
        self.name = name
    }

    deinit {
        print(name + " deinit")
    }
}

let delegates = DelegateCollection<Test>()

var rLinh: RefHuman? = RefHuman(name: "Linh R")
var rLinh1: RefHuman? = RefHuman(name: "Linh R")
var rLinh2: RefHuman? = RefHuman(name: "Linh R")
var rLinh3: RefHuman? = RefHuman(name: "Linh R")
var rLinh4: RefHuman? = RefHuman(name: "Linh R")
var rLinh5: RefHuman? = RefHuman(name: "Linh R")
var rLinh6: RefHuman? = RefHuman(name: "Linh R")
var rLinh7: RefHuman? = RefHuman(name: "Linh R")
var rLinh8: RefHuman? = RefHuman(name: "Linh R")
var rLinh9: RefHuman? = RefHuman(name: "Linh R")
var rLinh10: RefHuman? = RefHuman(name: "Linh R")

delegates.add(rLinh!)
delegates.add(rLinh1!)
delegates.add(rLinh2!)
delegates.add(rLinh3!)
delegates.add(rLinh4!)
delegates.add(rLinh5!)
delegates.add(rLinh6!)
delegates.add(rLinh7!)
delegates.add(rLinh8!)
delegates.add(rLinh9!)
delegates.add(rLinh10!)

rLinh = nil
rLinh1 = nil
rLinh2 = nil
rLinh3 = nil
rLinh4 = nil
rLinh5 = nil
rLinh6 = nil
rLinh7 = nil
rLinh8 = nil
rLinh9 = nil
rLinh10 = nil

delegates.trigger {
    $0.sayHi()
}
