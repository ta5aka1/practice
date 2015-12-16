let languages = ["Swift", "Objective-C", "Ruby", "PHP", "Java"]

var transformedLanguages = [String]()
for language in languages {
    transformedLanguages.append("Hello \(language)!")
}
print(transformedLanguages)


let trans2 = languages.map{(language) in "Hello! \(language)!"}
print(trans2)

