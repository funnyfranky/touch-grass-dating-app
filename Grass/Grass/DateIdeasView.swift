//
//  DateIdeasView.swift
//  Grass
//
//  Created by Josh Chapman on 2/13/26.
//

import Foundation
import SwiftUI

struct DateIdeasView: View {

    @State private var ideas: [DateIdea] = []
    @State private var selectedIdea: DateIdea?
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {

                // MARK: - Buttons
                VStack(spacing: 12) {

                    Button("Load All Date Ideas") {
                        Task {
                            await loadAllIdeas()
                        }
                    }

                    Button("Load My Date Ideas") {
                        Task {
                            await loadMyIdeas()
                        }
                    }

                    Button("Add Test Date Idea") {
                        Task {
                            await addTestIdea()
                        }
                    }

//                    Button("Delete Selected Idea") {
//                        Task {
//                            await deleteSelectedIdea()
//                        }
//                    }
//                    .disabled(selectedIdea == nil)

                }
                .buttonStyle(.borderedProminent)

                Divider()

                // MARK: - Loading State
                if isLoading {
                    ProgressView("Loading...")
                }

                // MARK: - Error Display
                if let errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }

                // MARK: - Table/List Display

                List(ideas, selection: $selectedIdea) { idea in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(idea.title)
                            .font(.headline)

                        Text(idea.description ?? "No description")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text("Created: \(idea.created_at.formatted())")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
            }
            .padding()
            .navigationTitle("Date Ideas")
        }
    }
    // MARK: - Functions

    func loadAllIdeas() async {
        isLoading = true
        errorMessage = nil

        do {
            ideas = try await SupabaseManager.shared.fetchAllDateIdeas()
        } catch {
            errorMessage = "Failed to load ideas: \(error.localizedDescription)"
        }

        isLoading = false
    }

    func loadMyIdeas() async {
        isLoading = true
        errorMessage = nil

        do {
            ideas = try await SupabaseManager.shared.fetchMyDateIdeas()
        } catch {
            errorMessage = "Failed to load your ideas: \(error.localizedDescription)"
        }

        isLoading = false
    }

    func addTestIdea() async {
        isLoading = true
        errorMessage = nil

        do {
            try await SupabaseManager.shared.insertDateIdea(
                title: "Coffee + Sunset Walk",
                description: "Grab coffee and walk by the water at sunset."
            )

            // Reload after insert
            ideas = try await SupabaseManager.shared.fetchAllDateIdeas()
        } catch {
            errorMessage = "Insert failed: \(error.localizedDescription)"
        }

        isLoading = false
    }

//    func deleteSelectedIdea() async {
//        guard let idea = selectedIdea else { return }
//
//        isLoading = true
//        errorMessage = nil
//
//        do {
//            try await SupabaseManager.shared.deleteDateIdea(id: idea.id)
//            ideas = try await SupabaseManager.shared.fetchAllDateIdeas()
//            selectedIdea = nil
//        } catch {
//            errorMessage = "Delete failed: \(error.localizedDescription)"
//        }
//
//        isLoading = false
//    }

}
