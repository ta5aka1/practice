import Foundation
let words = ["Cola", "Coffee", "orange juice", "Cider", "Pocari", "Tomato juice", "pose"]

typealias Entry = (Character, [String])

func buildWordGroup(words : [String]) -> [Entry] {
    func firstLetter(str: String) -> Character{
        return Character(str.substringToIndex(str.startIndex.advancedBy(1)).uppercaseString)
    }
    
    return distinct( words.map(firstLetter))
        .map{
            (letter) -> Entry in
            return (letter, words.filter{
                (word) -> Bool in
                    firstLetter(word) == letter
                })
    }
}

func distinct<T: Equatable>(source: [T]) -> [T]{
    var unique = [T]()
    for item in source{
        if !unique.contains(item) {
            unique.append(item)
        }
    }
    return unique
}

print(buildWordGroup(words))