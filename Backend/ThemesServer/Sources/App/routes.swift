import Vapor

func routes(_ app: Application) throws {
    
    app.get("themes", ":tag") { req -> String in
        guard let tag = req.parameters.get("tag", as: Int.self) else {
            throw Abort(.badRequest)
        }
        var themeJSON: String
        switch (tag) {
            case 0:
                themeJSON = try getThemeJSON(wordOfTheDay: "Movies", clueForWordOfTheDay: "M")
                break;
            case 1:
                themeJSON = try getThemeJSON(wordOfTheDay: "TV shows", clueForWordOfTheDay: "TV")
                break;
            case 2:
                themeJSON = try getThemeJSON(wordOfTheDay: "Countries", clueForWordOfTheDay: "C")
                break;
            case 3:
                themeJSON = try getThemeJSON(wordOfTheDay: "Famous People", clueForWordOfTheDay: "Famous")
                break;
            case 4:
                themeJSON = try getThemeJSON(wordOfTheDay: "Dictionary", clueForWordOfTheDay: "D")
                break;
            case 5:
                themeJSON = try getThemeJSON(wordOfTheDay: "Mix All", clueForWordOfTheDay: "M")
                break;
            default:
                themeJSON = "{}"
                break;
        }
        return themeJSON
    }
}

func getThemeJSON(wordOfTheDay word: String, clueForWordOfTheDay clue: String) throws -> String  {
    let theme = Theme(wordOfTheDay: word, clue: clue)
    let jsonEncoder = JSONEncoder()
    let jsonData = try jsonEncoder.encode(theme)
    guard let json = String(data: jsonData, encoding: String.Encoding.utf8) else {return "{}"}
    return "\(json)"
}
