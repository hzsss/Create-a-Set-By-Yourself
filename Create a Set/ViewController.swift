//
//  ViewController.swift
//  Create a Set
//
//  Created by 黄子汕 on 2018/8/13.
//  Copyright © 2018年 黄子汕. All rights reserved.
//

import UIKit

struct MYSet<T: Hashable>: Sequence, IteratorProtocol {
  typealias Element = T
  private var contents: [Element: Bool]

  private lazy var index: Int = {
    return self.count - 1
  }()

  init() {
    self.contents = [Element: Bool]()
  }

  var count: Int { return contents.count }
  var isEmpty: Bool { return contents.isEmpty }
  var elements: [Element] { return Array(self.contents.keys) }

  func contains(_ element: Element) -> Bool {
    return contents[element] ?? false
  }

  mutating func add(_ newElements: Element...) {
    newElements.map{ self.contents[$0] = true }
  }

  mutating func remove(_ element: Element) -> Element? {
    return contents.removeValue(forKey: element) != nil ? element: nil
  }

  mutating func next() -> Element? {
    print(index)
    if index == 0 {
      return nil
    } else {
      defer {index -= 1}
      return Array(self.contents.keys)[index]
    }
  }
}

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    var vowelSet: MYSet<String> = MYSet()               // empty set
    vowelSet.add("a", "e", "i", "o", "u", "y")      // a, e, i, o, u, y
    vowelSet.remove("y")                            // eh, leave out y
    print(vowelSet.contains("y"))

    for item in vowelSet {
      print("--:\(item)")
    }
  }
}
