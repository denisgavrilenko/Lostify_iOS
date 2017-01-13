//
//  CountryAPISpec.swift
//  Lostify_iOS
//
//  Created by Denis Gavrilenko on 1/13/17.
//  Copyright © 2017 DreamTeam. All rights reserved.
//

import Quick
import Nimble

class CountryAPISpec: QuickSpec {
    override func spec() {
        it("get all countries from server.") {
            waitUntil(action: { done in
                CountryAPI.apiCountryGet(completion: { countries, error in
                    expect(countries).toNot(beNil())
                    expect(error).to(beNil())
                    done()
                })
            })
        }
    }
}
