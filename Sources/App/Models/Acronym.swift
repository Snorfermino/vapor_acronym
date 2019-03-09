import Vapor
import FluentPostgreSQL

final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String

    init(short: String, long: String) {
        self.long = long
        self.short = short
    }
}

extension Acronym: PostgreSQLModel {}

extension Acronym: Migration {}

extension Acronym: Content {}