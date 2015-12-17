import Foundation
let words = ["Cola", "Coffee", "orange juice", "Cider", "Pocari", "Tomato juice", "pose"]

typealias Entry = (Character, [String])

func buildWordGroup(words: [String]) -> [Entry]{
    var result = [Entry]()
    
    var letters = [Character]()
    for word in words {
        let firstLetter = Character(word.substringToIndex(word.startIndex.advancedBy(1)).uppercaseString)
        
        if !letters.contains(firstLetter) {
            letters.append(firstLetter)
        }
    }
    
    for letter in letters{
        var wordsForLetter = [String]()
        for word in words{
            let firstLetter = Character(word.substringToIndex(word.startIndex.advancedBy(1)).uppercaseString)
            
            if firstLetter == letter{
                wordsForLetter.append(word)
            }
        }
        result.append((letter, wordsForLetter))
    }
    
    return result
}

print(buildWordGroup(words))