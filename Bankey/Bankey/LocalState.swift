//
//  LocalState.swift
//  Bankey
//
//  Created by Vladimir Fibe on 11.09.2022.
//

import Foundation

public class LocalState {
  private enum Keys: String {
    case hasOnboarded
  }
  
  public static var hasOnboarded: Bool {
    get {
      UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
    }
    set {
      UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
    }
  }
}
