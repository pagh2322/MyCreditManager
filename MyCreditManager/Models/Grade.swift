//
//  Grade.swift
//  MyCreditManager
//
//  Created by peo on 2022/11/21.
//

enum Grade: CaseIterable {
	
	case aP
	case a
	case bP
	case b
	case cP
	case c
	case dP
	case d
	case f
	
	var score: Double {
		switch self {
		case .aP: return 4.5
		case .a: return 4.0
		case .bP: return 3.5
		case .b: return 3.0
		case .cP: return 2.5
		case .c: return 2.0
		case .dP: return 1.5
		case .d: return 1.0
		case .f: return 0.0
		}
	}
	
	var label: String {
		switch self {
		case .aP: return "A+"
		case .a: return "A"
		case .bP: return "B+"
		case .b: return "B"
		case .cP: return "C+"
		case .c: return "C"
		case .dP: return "D+"
		case .d: return "D"
		case .f: return "F"
		}
	}
	
	func equalsTo(string: String) -> Bool {
		return self.label == string
	}
}
