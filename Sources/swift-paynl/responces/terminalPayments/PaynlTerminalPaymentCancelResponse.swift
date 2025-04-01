//
//  PaynlTerminalPaymentCancelResponse.swift
//
//
//  Created by Zhanna Hakobyan on 08.11.24.
//

import Foundation

// MARK: - PaynlTerminalPaymentCancelResponse
struct PaynlTerminalPaymentCancelResponse: Codable {
    let error   : String? // "0"_ cancel, "1"_ already cancelled
    let errormsg: String?
}
