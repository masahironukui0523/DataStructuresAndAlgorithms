import Cocoa

let string = "GRAND"

func changeString(string: String) -> String {
    var word = ""
    let dic = [
        "5":"P",
        "K":"4",
        "D":"1",
        "P":"2",
        "L":"L",
        "N":"N",
        "T":"T",
        "U":"U",
        "R":"R",
        "G":"6"
        ] as [String : String]
    
    for (_, v) in string.enumerated() {
        let key =  String(v)
        word.append(contentsOf: dic[key]!)
    }
    return word
}

let ans = changeString(string: string)
print(ans)
