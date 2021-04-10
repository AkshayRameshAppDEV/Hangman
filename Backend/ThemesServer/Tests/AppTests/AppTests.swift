@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testThemesEndpoint() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        for i in 0...5 {
            try app.test(.GET, "themes/\(i)", afterResponse: { res in
                XCTAssertEqual(res.status, .ok)
                XCTAssertNotEqual(res.body.string, "{}")
            })
        }
    }
}
