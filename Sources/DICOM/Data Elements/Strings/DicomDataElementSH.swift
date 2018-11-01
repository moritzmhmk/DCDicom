//
//  DicomDataElementSH.swift
//  SwiftDicom
//
//  Created by Lasse Porsch on 27.10.18.
//  Copyright © 2018 DCSM GmbH. All rights reserved.
//

import Foundation

/**
 SH - Short String

 # Definition
 A character string that may be padded with leading and/or trailing spaces. The character code 05CH (the BACKSLASH "\" in ISO-IR 6) shall not be present,
 as it is used as the delimiter between values for multiple data elements. The string shall not have Control Characters except ESC.

 # Character Reportoire
 Default Character Repertoire and/or as defined by (0008,0005) excluding character code 5CH (the BACKSLASH "\" in ISO-IR 6) and all Control Characters
 except ESC when used for ISO 2022 escape sequences.

 # Length of value
 16 chars maximum (see Note in Section 6.2)
 */
public class DicomDataElementSH: DicomDataElement {

    public override var stringValue: String? {
        guard let value = self.rawValue else {
            return nil
        }
        guard let stringValue = String(data: value, encoding: .ascii) else {
            return "[Unrecognized String data]"
        }
        return stringValue
    }
}