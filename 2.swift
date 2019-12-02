import Foundation

let input = [1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,9,1,19,1,19,5,23,1,23,6,27,2,9,27,31,1,5,31,35,1,35,10,39,1,39,10,43,2,43,9,47,1,6,47,51,2,51,6,55,1,5,55,59,2,59,10,63,1,9,63,67,1,9,67,71,2,71,6,75,1,5,75,79,1,5,79,83,1,9,83,87,2,87,10,91,2,10,91,95,1,95,9,99,2,99,9,103,2,10,103,107,2,9,107,111,1,111,5,115,1,115,2,119,1,119,6,0,99,2,0,14,0]

func solve(_ input: [Int]) -> Int {
    var result = input
    var i = 0

    while result[i] != 99 {
        if result[i] == 1 {
            let first = result[i+1]
            let second = result[i+2]
            let v = result[first] + result[second]
            let third = result[i+3]
            result[third] = v

            i += 4
        }

        if result[i] == 2 {
            let first = result[i+1]
            let second = result[i+2]
            let v = result[first] * result[second]
            let third = result[i+3]
            result[third] = v

            i += 4
        }
    }

    return result.first!
}

let solution = solve(input)

print("1: \(solution)")

// MARK: - Part 2

func find(_ input: [Int]) -> (Int,Int) {
    for i in 0...99 {
        for j in 0...99 {
            var result = input
            result[1] = i
            result[2] = j
            if solve(result) == 19690720 {
                return (i, j)
            }
        }
    }
    return (0, 0)
}

let second = find(input)

print("2: \(100 * second.0 + second.1)")

