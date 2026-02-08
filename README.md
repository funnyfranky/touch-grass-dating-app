# Grass 🌿

*A location-based date idea discovery app*

## Overview

Grass is an iOS application designed to help users discover, share, and explore "go-and-do" date ideas in their area. Users can browse geo-tagged date ideas on a map, view details, and contribute their own recommendations to the community.

This project is being developed as a senior computer science capstone project and focuses on full-stack mobile development, backend integration, and secure database design.

---

## Features (Current / MVP)

* User authentication (Supabase Auth)
* Add new date ideas
* Store date ideas with:

  * Title
  * Description
  * Location (geo-tagged)
  * Creator reference
* Secure database access using Row Level Security (RLS)
* iOS SwiftUI interface
* Supabase backend (PostgreSQL)

---

## Planned Features

* Map-based browsing of date ideas
* Ratings and reviews
* Image uploads
* Saved lists / favorites
* Filtering by category
* Mobile-friendly UI polish and usability improvements

---

## Tech Stack

**Frontend**

* Swift
* SwiftUI
* iOS SDK

**Backend**

* Supabase
* PostgreSQL
* Row Level Security (RLS)
* RESTful API integration

**Architecture Concepts**

* Secure client-server communication
* UUID-based user identity management
* Database policy enforcement
* Modular service layer (SupabaseManager)

---

## Project Structure

```
Grass/
├── GrassApp.swift
├── ContentView.swift
├── DateIdea.swift
├── SupabaseManager.swift
├── Assets.xcassets/
```

---

## Security Notes

* No service role keys are stored in this repository.
* Public anon keys are managed separately.
* Row Level Security policies restrict data access to authenticated users.

---

## Getting Started

1. Clone the repository.
2. Add your Supabase project URL and anon public key in a configuration file.
3. Run the project in Xcode.
4. Sign up or log in through the app to begin testing.

---

## Purpose of the Project

This project demonstrates:

* Full-stack mobile application development
* Secure backend integration
* Database schema design
* Policy-based access control
* Self-directed learning of new technologies

---

## Author

Josh Chapman
BYU-I Senior Computer Science Student
