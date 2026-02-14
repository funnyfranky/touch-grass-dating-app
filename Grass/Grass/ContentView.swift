//
//  ContentView.swift
//  Grass
//
//  Created by Josh Chapman on 2/7/26.
//

import SwiftUI
import Supabase

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Testing Supabase...")
                .padding()
        }
        .task {
            await runTests()
        }
    }

    func runTests() async {
//        await testLogin()
//        await testInsert()
//        await testFetch()
        }

    func testFetch() async {
        do {
            let ideas = try await SupabaseManager.shared.fetchAllDateIdeas()
            print("FETCH SUCCESS")
            print(ideas)
            
        } catch {
            print("FETCH ERROR")
            print(error)
        }
    }
    
    func testInsert() async {
        do {
            try await SupabaseManager.shared.insertDateIdea(
                title: "Swift Test Date",
                description: "Inserted from iOS app"
            )
            print("INSERT SUCCESS")
        } catch {
            print("INSERT ERROR")
            print(error)
        }
    }
    
    func testLogin() async {
        do {
            try await SupabaseManager.shared.signIn(
                email: "mail@mail.com",
                password: "yeet"
            )
            
            print("LOGIN SUCCESS")
            
        } catch {
            print("LOGIN ERROR")
            print(error)
        }
    }
}

#Preview {
    ContentView()
}
