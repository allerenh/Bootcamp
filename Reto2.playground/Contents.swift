func counter(text: String) {
    
    let letters = text.lowercased().split(separator: " ").joined(separator: "")
    var counts: [String: Int] = [:]
    for letter in letters {
        counts[String(letter)] = (counts[String(letter)] ?? 0) + 1
    }
    counts.map{
        print($0.key + " =", $0.value )
    }
}

counter(text: "la historia de mi vida")


