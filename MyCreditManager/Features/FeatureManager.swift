//
//  FeatureManager.swift
//  MyCreditManager
//
//  Created by peo on 2022/11/21.
//

import Foundation

protocol FeatureManager {
	var feature: Feature { get }
	var students: [Student] { get }
	func excute() -> [Student]
	func printIntro()
}

extension FeatureManager {
	func printIntro() {
		print(feature.intro)
	}
}
