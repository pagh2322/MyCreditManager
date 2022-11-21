//
//  Feature.swift
//  MyCreditManager
//
//  Created by peo on 2022/11/21.
//

import Foundation

enum Feature: String, CaseIterable {
	case addStudent = "1"
	case deleteStudent = "2"
	case addGrade = "3"
	case deleteGrade = "4"
	case checkGPA = "5"
	case exit = "X"
	case unknown
	
	func equalsTo(string: String) -> Bool {
		return self.rawValue == string
	}
	
	var intro: String {
		switch self {
		case .addStudent:
			return "추가할 학생의 이름을 입력해주세요"
		case .deleteStudent:
			return "삭제할 학생의 이름을 입력해주세요"
		case .addGrade:
			return "성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례대로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다."
		case .deleteGrade:
			return "성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift"
		case .checkGPA:
			return "평점을 알고싶은 학생의 이름을 입력해주세요"
		case .exit:
			return "프로그램을 종료합니다.."
		case .unknown:
			return "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
		}
	}
}
