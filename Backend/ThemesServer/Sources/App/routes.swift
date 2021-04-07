import Vapor

func routes(_ app: Application) throws {
    
    app.get("themes", ":tag") { req -> String in
        guard let tag = req.parameters.get("tag", as: Int.self) else {
            throw Abort(.badRequest)
        }
        var themeJSON: String
        switch (tag) {
            case 0:
                let wordOfTheDayAndClueFromFile = try getWordOfTheDayAndClueFromFile("Movies")
                guard let x = wordOfTheDayAndClueFromFile.first else {return ""}
                themeJSON = try getThemeJSON(wordOfTheDay: x.key, clueForWordOfTheDay: x.value)
                break;
            case 1:
                let wordOfTheDayAndClueFromFile = try getWordOfTheDayAndClueFromFile("TV_Shows")
                guard let x = wordOfTheDayAndClueFromFile.first else {return ""}
                themeJSON = try getThemeJSON(wordOfTheDay: x.key, clueForWordOfTheDay: x.value)
                break;
            case 2:
                let wordOfTheDayAndClueFromFile = try getWordOfTheDayAndClueFromFile("Countries")
                guard let x = wordOfTheDayAndClueFromFile.first else {return ""}
                themeJSON = try getThemeJSON(wordOfTheDay: x.key, clueForWordOfTheDay: x.value)
                break;
            case 3:
                let wordOfTheDayAndClueFromFile = try getWordOfTheDayAndClueFromFile("Famous_People")
                guard let x = wordOfTheDayAndClueFromFile.first else {return ""}
                themeJSON = try getThemeJSON(wordOfTheDay: x.key, clueForWordOfTheDay: x.value)
                break;
            case 4:
                let wordOfTheDayAndClueFromFile = try getWordOfTheDayAndClueFromFile("Dictionary")
                guard let x = wordOfTheDayAndClueFromFile.first else {return ""}
                themeJSON = try getThemeJSON(wordOfTheDay: x.key, clueForWordOfTheDay: x.value)
                break;
            case 5:
                let wordOfTheDayAndClueFromFile = try getWordOfTheDayAndClueFromFile("Mix_All")
                guard let x = wordOfTheDayAndClueFromFile.first else {return ""}
                themeJSON = try getThemeJSON(wordOfTheDay: x.key, clueForWordOfTheDay: x.value)
                break;
            default:
                themeJSON = "{}"
                break;
        }
        return themeJSON
    }
}

func getWordOfTheDayAndClueFromFile(_ theme: String) throws -> [String:String] {
    let filepath = "/Users/akshayramesh/Desktop/Side_Projects/Hangman/Backend/ThemesServer/Sources/App/Data/\(theme).txt"
    var themeDict = [String:String]()
    var randomWordOfTheDayAndClueDict = [String:String]()
    do {
        let themeFileContents = try String(contentsOfFile: filepath)
        let themeFileItems = themeFileContents.components(separatedBy: "\n")
        for themeFileItem in themeFileItems {
            guard let wordOfTheDay = themeFileItem.components(separatedBy: " : ").first else {return [:]}
            guard let clue = themeFileItem.components(separatedBy: " : ").last else {return[:]}
            if (wordOfTheDay != "" && clue != "") {
                themeDict[wordOfTheDay] = clue
            }
        }
        if let wordAndClueDict = themeDict.randomElement() {
            randomWordOfTheDayAndClueDict[wordAndClueDict.key] = wordAndClueDict.value
        }
    } catch {
        print("\(error.localizedDescription)")
    }
    return randomWordOfTheDayAndClueDict
}

func getThemeJSON(wordOfTheDay word: String, clueForWordOfTheDay clue: String) throws -> String  {
    let theme = Theme(wordOfTheDay: word, clue: clue)
    let jsonEncoder = JSONEncoder()
    let jsonData = try jsonEncoder.encode(theme)
    guard let json = String(data: jsonData, encoding: String.Encoding.utf8) else {return "{}"}
    return "\(json)"
}
