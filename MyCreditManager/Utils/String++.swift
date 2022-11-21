//
//  String++.swift
//  MyCreditManager
//
//  Created by peo on 2022/11/21.
//

import Foundation

extension String {
	var feature: Feature {
		var feature = Feature.unknown
		Feature.allCases.forEach {
			if $0.equalsTo(string: self) {
				feature = $0
				return
			}
		}
		return feature
	}
}

extension String {
	var grade: Grade? {
		var grade: Grade? = nil
		Grade.allCases.forEach {
			if $0.equalsTo(string: self) {
				grade = $0
				return
			}
		}
		return grade
	}
}
