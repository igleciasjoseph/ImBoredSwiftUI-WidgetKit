//
//  String.swift
//  ImBored
//
//  Created by Joseph Iglecias on 10/10/24.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
