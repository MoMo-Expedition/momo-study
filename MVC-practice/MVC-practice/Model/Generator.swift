//
//  Generator.swift
//  MVC-practice
//
//  Created by Noah Park on 2023/03/24.
//

import Foundation


// 1. 숫자 생성
// 2. 저장된 걸 초기화
class Generator {
    
    fileprivate var numbers: [Int] = [] //= [Int]()  // Array<Int>()
    
    func generateSingleRandomNumber(start: Int, end: Int) -> Int {
        let newNumber = Int.random(in: start...end)
        return newNumber
    }
    
    func initNumbers() {
        numbers.removeAll()
    }
    
}

// 1. 숫자 6개를 뽑자
// 2. 중복을 검사하자
final class LottoGenerator: Generator {

    func generateLottoNumbers() {
        initNumbers()
        while numbers.count < 6 {
            let newNumber = generateSingleRandomNumber(start: 1, end: 45)
            if numbers.contains(newNumber) == false {
                numbers.append(newNumber)
            }
        }
    }
    
    func getLottoNumbers() -> [Int]? {
        if numbers.count == 6 {
            return numbers.sorted(by: <)
        } else {
            return nil
        }
    }
}
