// Copyright © 2017-2019 Trust Wallet.
//
// This file is part of Trust. The full Trust copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

import Foundation

public final class HarmonyAddress: Address {

    public static func == (lhs: HarmonyAddress, rhs: HarmonyAddress) -> Bool {
        return TWHarmonyAddressEqual(lhs.rawValue, rhs.rawValue)
    }

    public static func isValidString(string: String) -> Bool {
        let stringString = TWStringCreateWithNSString(string)
        defer {
            TWStringDelete(stringString)
        }
        return TWHarmonyAddressIsValidString(stringString)
    }

    public var description: String {
        return TWStringNSString(TWHarmonyAddressDescription(rawValue))
    }

    public var keyHash: Data {
        return TWDataNSData(TWHarmonyAddressKeyHash(rawValue))
    }

    let rawValue: OpaquePointer

    init(rawValue: OpaquePointer) {
        self.rawValue = rawValue
    }

    public init?(string: String) {
        let stringString = TWStringCreateWithNSString(string)
        defer {
            TWStringDelete(stringString)
        }
        guard let rawValue = TWHarmonyAddressCreateWithString(stringString) else {
            return nil
        }
        self.rawValue = rawValue
    }

    public init?(keyHash: Data) {
        let keyHashData = TWDataCreateWithNSData(keyHash)
        defer {
            TWDataDelete(keyHashData)
        }
        guard let rawValue = TWHarmonyAddressCreateWithKeyHash(keyHashData) else {
            return nil
        }
        self.rawValue = rawValue
    }

    public init(publicKey: PublicKey) {
        rawValue = TWHarmonyAddressCreateWithPublicKey(publicKey.rawValue)
    }

    deinit {
        TWHarmonyAddressDelete(rawValue)
    }

}
