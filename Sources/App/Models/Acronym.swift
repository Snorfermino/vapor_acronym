import Vapor
import FluentSQLite

final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String

    init(short: String, long: String) {
        self.long = long
        self.short = short
    }
}

// extension Acronym: Model {
    
//     typealias Database = SQLiteDatabase
//     typealias ID = Int

//     public static var idKey: IDKey = \Acronym.id
// }

extension Acronym: SQLiteModel {}

extension Acronym: Migration {}

extension Acronym: Content {}