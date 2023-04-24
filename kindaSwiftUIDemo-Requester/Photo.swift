//
//  Photo.swift
//  kindaSwiftUIDemo-Requester
//
//  Created by Alex Nagy on 24.04.2023.
//

import SwiftUI

struct Photo: Decodable, Identifiable {
    let id: String
    let title: String
    let url: String
}
