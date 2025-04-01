//
//  PaynlTerminalPaymentStatusResponse.swift
//
//
//  Created by Zhanna Hakobyan on 08.11.24.
//

import Foundation

// MARK: - PaynlTerminalPaymentStatusResponse
struct PaynlTerminalPaymentStatusResponse: Codable {
    let status             : String?
    let txid               : String?
    let terminal           : String?
    let ssai               : String?
    let approvalID         : String?
    let ticket             : String?
    let amount             : String?
    let incidentCode       : String?
    let incidentCodeText   : String?
    let cancelled          : String?
    let approved           : String?
    let cardBrandLabelName : String?
    let cardBrandIdentifier: String?
    let error              : String?
    let errormsg           : String?

    enum CodingKeys: String, CodingKey {
        case status, txid, terminal, ssai, ticket
        case amount, cancelled, approved, error, errormsg
        case cardBrandLabelName  = "cardbrandlabelname"
        case cardBrandIdentifier = "cardbrandidentifier"
        case approvalID          = "approvalID"
        case incidentCode        = "incidentcode"
        case incidentCodeText    = "incidentcodetext"
    }
}
