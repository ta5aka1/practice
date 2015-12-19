import Foundation

let data = "コーラ オレンジジュース スプライト ボス"
let csv = "ハワイ,パリ,上海,台湾,香港"

func createSplitter(separator:String)(source:String) ->[String]{
    return source.componentsSeparatedByString(separator)
}

let spaceSplitter = createSplitter(" ")
print(spaceSplitter(source:data))

let commaSplitter = createSplitter(",")
print(commaSplitter(source:csv))