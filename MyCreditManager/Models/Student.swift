//
//  Student.swift
//  MyCreditManager
//
//  Created by peo on 2022/11/21.
//

struct Student {
	let name: String
	var subjects: [Subject] = []
	var gpa: Double {
		return subjects.reduce(0) { $0 + $1.grade.score }
	}
	
	mutating func replaceSubject(with newSubject: Subject, at position: Int) {
		subjects[position] = newSubject
	}
	
	mutating func removeSubject(at position: Int) {
		subjects.remove(at: position)
	}
}
