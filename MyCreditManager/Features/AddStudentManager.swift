//
//  AddStudentManager.swift
//  MyCreditManager
//
//  Created by peo on 2022/11/21.
//

import Foundation

final class StudentManager: FeatureManager {
	
	internal var students: [Student]
	internal var feature: Feature
	
	init(
		_ feature: Feature,
		students: [Student]
	) {
		self.students = students
		self.feature = feature
	}
	
	func excute() -> [Student] {
		printIntro()
		guard let studentName = readLine() else { return [] }
		switch feature {
		case .addStudent: addStudent(studentName)
		case .deleteStudent: deleteStudent(studentName)
		default: break
		}
		return students
	}
	
	private func addStudent(_ studentName: String) {
		if students.contains(where: { $0.name == studentName }) {
			print("\(studentName)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
		} else {
			students.append(Student(name: studentName))
			print("\(studentName) 학생을 추가했습니다.")
		}
	}
	
	private func deleteStudent(_ studentName: String) {
		if let index = students.firstIndex(where: { $0.name == studentName }) {
			students.remove(at: index)
			print("\(studentName) 학생을 삭제하였습니다.")
		} else {
			print("\(studentName) 학생을 찾지 못했습니다.")
		}
	}
	
}
