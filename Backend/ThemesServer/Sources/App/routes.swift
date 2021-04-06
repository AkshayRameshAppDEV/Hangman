import Vapor

func routes(_ app: Application) throws {
    
    app.get("themes", ":tag") { req -> String in
        guard let tag = req.parameters.get("tag", as: Int.self) else {
            throw Abort(.badRequest)
        }
        var themeJSON: String
        switch (tag) {
            case 0:
                themeJSON = try getThemeJSON(with: tag, wordOfTheDay: "Movies", clueForWordOfTheDay: "M")
                break;
            case 1:
                themeJSON = try getThemeJSON(with: tag, wordOfTheDay: "TV shows", clueForWordOfTheDay: "TV")
                break;
            case 2:
                themeJSON = try getThemeJSON(with: tag, wordOfTheDay: "Countries", clueForWordOfTheDay: "C")
                break;
            case 3:
                themeJSON = try getThemeJSON(with: tag, wordOfTheDay: "Famous People", clueForWordOfTheDay: "Famous")
                break;
            case 4:
                themeJSON = try getThemeJSON(with: tag, wordOfTheDay: "Dictionary", clueForWordOfTheDay: "D")
                break;
            case 5:
                themeJSON = try getThemeJSON(with: tag, wordOfTheDay: "Mix All", clueForWordOfTheDay: "M")
                break;
            default:
                themeJSON = "{}"
                break;
        }
        return themeJSON
    }
}

func getThemeJSON(with tag: Int, wordOfTheDay word: String, clueForWordOfTheDay clue: String) throws -> String  {
    let theme = Theme(wordOfTheDay: word, clue: clue)
    let jsonEncoder = JSONEncoder()
    let jsonData = try jsonEncoder.encode(theme)
    guard let json = String(data: jsonData, encoding: String.Encoding.utf8) else {return "{}"}
    return "\(json) + \(tag)"
}
