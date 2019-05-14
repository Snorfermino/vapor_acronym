import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }

    router.get("users", ":id") { request in
        guard let userId = request.parameters["id"]?.int else {
            throw Abort.badRequest
        }

        return "You requested User #\(userId)"
    }

    router.get("api", "acronyms", Acronym.parameter) { req -> Future<Acronym> in
        return try req.parameters.next(Acronym.self)
    }

    router.post("api", "acronyms") { req -> Future<Acronym> in
        return try req.content.decode(Acronym.self).flatMap(to: Acronym.self) { acronym in
            return acronym.save(on: req)
        } 
    }

    router.put("api", "acronym", Acronym.parameter) { req -> Future<Acronym> in
        return try flatMap(to: Acronym.self, req.parameter.next(Acronym.self),
                                             req.content.decode(Acronym.self)) {
                                                 acronym, updatedAcronym in
                                                 acronym.short = updatedAcronym.short
                                                 acronym.long = updatedAcronym.long
                                                 return acronym.save(on: req)
                                             }
    }
}
