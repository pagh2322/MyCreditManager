//
//  GradeManager.swift
//  MyCreditManager
//
//  Created by peo on 2022/11/21.
//

import Foundation

final class GradeManager: FeatureManager {
	
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
		guard let readedLine = readLine() else { return [] }
		let parsed = parseReadLine(readedLine)
		switch feature {
		case .addGrade: addGrade(parsed)
		case .deleteGrade: deleteGrade(parsed)
		case .checkGPA: checkGPA(parsed[0])
		default: break
		}
		return students
	}
	
	private func addGrade(_ studentGradeScore: [String]) {
		guard studentGradeScore.count == 3,
					let grade = studentGradeScore[2].grade
		else {
			print("입력이 잘못되었습니다. 다시 확인해주세요.")
			return
		}
		guard let index = students.firstIndex(where: { $0.name == studentGradeScore[0] })
		else {
			print("\(studentGradeScore[0]) 학생을 찾지 못했습니다.")
			return
		}
		
		let subject = Subject(name: studentGradeScore[1], grade: grade)
		
		if students[index].subjects.contains(where: { $0.name == studentGradeScore[1] }) {
			students[index].replaceSubject(with: subject, at: index)
			print("\(studentGradeScore[0]) 학생의 \(studentGradeScore[1]) 과목이 \(grade.label)로 변경되었습니다.")
		} else {
			students[index].subjects.append(subject)
			print("\(studentGradeScore[0]) 학생의 \(studentGradeScore[1]) 과목이 \(grade.label)로 추가되었습니다.")
		}
	}
	
	private func deleteGrade(_ studentAndGrade: [String]) {
		guard studentAndGrade.count == 2
		else {
			print("입력이 잘못되었습니다. 다시 확인해주세요.")
			return
		}
		guard let index = students.firstIndex(where: { $0.name == studentAndGrade[0] })
		else {
			print("\(studentAndGrade[0]) 학생을 찾지 못했습니다.")
			return
		}
		
		if let subjectIndex = students[index].subjects
			.firstIndex(where: { $0.name == studentAndGrade[1] }) {
			students[index].removeSubject(at: subjectIndex)
			print("\(studentAndGrade[0]) 학생의 \(studentAndGrade[1]) 과목의 성적이 삭제되었습니다.")
		} else {
			print("\(studentAndGrade[0]) 학생의 \(studentAndGrade[1]) 과목의 성적이 없습니다.")
		}
	}
	
	private func checkGPA(_ studentName: String) {
		if let index = students.firstIndex(where: { $0.name == studentName }) {
			students[index].subjects.forEach {
				print("\($0.name): \($0.grade.label)")
			}
			print("평점: \(students[index].gpa)")
		} else {
			print("\(studentName) 학생을 찾지 못했습니다.")
		}
	}
	
	private func parseReadLine(_ readedLine: String) -> [String] {
		return readedLine.components(separatedBy: " ")
	}
	
}
