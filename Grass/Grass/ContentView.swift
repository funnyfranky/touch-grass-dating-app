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
            await testLogin()
            await testInsert()
            await testFetch()
        }
    }
    
    func testFetch() async {
        do {
            let response = try await SupabaseManager.shared.client
                .from("date_ideas")
                .select()
                .execute()
            
            let data = response.data
            
            let decoder = JSONDecoder()
            let ideas = try decoder.decode([DateIdea].self, from: data)
            
            print("FETCH SUCCESS")
            print(ideas)
            
        } catch {
            print("FETCH ERROR")
            print(error)
        }
    }
    
    func testInsert() async {
        do {
            try await SupabaseManager.shared.client
                .from("date_ideas")
                .insert([
                    "title": "Swift Test Date",
                    "description": "Inserted from iOS app",
                    "location_name": "Test Location"
                ])
                .execute()
            
            print("INSERT SUCCESS")
            
        } catch {
            print("INSERT ERROR")
            print(error)
        }
    }
    
    func testLogin() async {
        do {
            try await SupabaseManager.shared.client.auth.signIn(
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
