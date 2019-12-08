import Foundation

// Extensions

extension Array {
    func chunks(_ chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}

// Read input
let file = Bundle.main.url(forResource: "File", withExtension: nil)
let input = try String(contentsOf: file!, encoding: .utf8)

let digits = input.compactMap{ Int(String($0)) }

let size = 25 * 6
let layers = digits.chunks(size)

// One
var l: [Int] = Array(repeating: 0, count: 0)
for layer in layers {
    let stripped = layer.filter { $0 != 0 }
    if stripped.count > l.count {
        l = stripped
    }
}
let ones = l.filter{ $0 == 1}.count
let twos = l.filter{ $0 == 2}.count
let result = ones * twos

print("Solution: \(result)")

// Two
var grid = Array(repeating: -1, count: 150)
for layer in layers {
    for (i, n) in layer.enumerated() {
        if [-1,2].contains(grid[i]) {
            grid[i] = n
        }
    }
}

let output = grid.map { $0 == 1 ? "o" : " "}.chunks(25).map{ $0.joined(separator: "")}.joined(separator: "\n")

print(output)

