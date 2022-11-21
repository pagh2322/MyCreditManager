//
//  CreditManager.swift
//  MyCreditManager
//
//  Created by peo on 2022/11/21.
//

import Foundation

final class CreditManager {
	
	private var students: [Student] = []
	
	func excute() {
		printIntro()
		while !scanFeature() {
			printIntro()
		}
	}
	
	func printIntro() {
		print("원하는 기능을 입력해주세요")
		print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
	}
	
	func scanFeature() -> Bool {
		if let readedLine = readLine() {
			switch readedLine.feature {
			case .addStudent, .deleteStudent:
				students = StudentManager(readedLine.feature, students: students).excute()
			case .addGrade, .deleteGrade, .checkGPA:
				students = GradeManager(readedLine.feature, students: students).excute()
			case .exit:
				print("프로그램을 종료합니다..")
				return true
			case .unknown:
				print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
			}
		} else {
			print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
		}
		return false
	}
	
}
