//
//  SupabaseManager.swift
//  Grass
//
//  Created by Josh Chapman on 2/7/26.
//

import Foundation
import Supabase
import Combine

class SupabaseManager: ObservableObject {

    static let shared = SupabaseManager()

    private let client: SupabaseClient

    init() {
        client = SupabaseClient(
            supabaseURL: URL(string: "")!,
            supabaseKey: ""
        )
    }

    // MARK: - Fetch All Date Ideas

// ORIGINAL FUNCTION TO PUT BACK
//    func fetchAllDateIdeas() async throws -> [DateIdea] {
//        let response: [DateIdea] = try await client
//            .from("date_ideas")
//            .select()
//            .order("created_at", ascending: false)
//            .execute()
//            .value
//
//        return response
//    }
    
    func fetchAllDateIdeas() async throws -> [DateIdea] {
        let response = try await client
            .from("date_ideas")
            .select()
            .order("created_at", ascending: false)
            .execute()

        // 🔎 PRINT RAW JSON FROM SUPABASE
        if let jsonString = String(data: response.data, encoding: .utf8) {
            print("RAW JSON FROM SUPABASE:")
            print(jsonString)
        }

        // Now decode manually
        let decoder = JSONDecoder()
        let ideas = try decoder.decode([DateIdea].self, from: response.data)

        return ideas
    }


    // MARK: - Insert New Date Idea

    func insertDateIdea(title: String, description: String) async throws {
        try await client
            .from("date_ideas")
            .insert([
                "title": title,
                "description": description
            ])
            .execute()
    }

    // MARK: - Fetch Current User's Ideas

    func fetchMyDateIdeas() async throws -> [DateIdea] {
        guard let user = try? await client.auth.session.user else {
            throw NSError(domain: "NoUser", code: 401)
        }

        let response: [DateIdea] = try await client
            .from("date_ideas")
            .select()
            .eq("created_by", value: user.id)
            .execute()
            .value

        return response
    }

    // MARK: - Delete Date Idea

    func deleteDateIdea(id: UUID) async throws {
        try await client
            .from("date_ideas")
            .delete()
            .eq("id", value: id)
            .execute()
    }
    
    // MARK: - SIGN IN
    func signIn(email: String, password: String) async throws {
        try await client.auth.signIn(
            email: email,
            password: password
        )
    }
}
