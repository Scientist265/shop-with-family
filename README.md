# sippylife_assesment
It's  a collaborative cart management Flutter app built with a modular architecture and robust state handling and manages cart in real-time, using Riverpod for Statemanagement, Freezed, and Firebase  to enable session-based shared cart management between a host and a friend, also AutoRoute for declarative, type-safe navigation.

##  Setup Instruction && Key Packages in use:

- flutter_riverpod for scalable and testable state management
- auto_route for declarative and guarded routing
- freezed + json_serializable for immutable data modeling
- firebase_auth, cloud_firestore, and firebase_dynamic_links for backend, auth, and deep link handling
- fpdart for functional programming patterns
- dotenv, dio, and share_plus for env config, networking, and sharing

I used Dio with mixin for scenerio where i generated an endpoint to fetch mock data locally with and extension called live server on vs code 

## Routing
Routing is handled with AutoRoute and defined centrally in AppRouter. Each screen is mapped using AutoRoute, and dynamic segments are used for session-based routes like:

AutoRoute(page: JoinSessionWithIdRoute.page, path: '/session/:sessionId')

The app also supports deep linking via Firebase Dynamic Links. When a user clicks on a session link (e.g., myapp.com/session/abc123), the app parses the URI and navigates to the session route using:
even though the linking is not working but it's simulated with Toast


A SessionGuard ensures only valid session links can proceed into protected routes like /products/:sessionId or /cart/:sessionId.
## State Management (Riverpod)
Why Riverpod?
Null-safety by default
Flexible provider scoping
Excellent testability
Automatic dispose management

Key Providers:
SessionViewModel: Manages shopping session state
CartViewModel: Handles shared cart operations
ProductRepository: Manages product data

## Fake Data Implementation

- 10 mock products with realistic pricing
- Local JSON fallback mechanism
- Session Simulation:
- UUID-based session IDs
- In-memory session storage

## Current Limitations
- No true user authentication system
- Basic error handling implementation
- Limited product catalog (15 items)
- No local persistence of sessions
- Basic UI animations only

## Key Assumptions
- Sessions are short-lived (<24h)
- Products have fixed inventory
- No payment integration required

## Suggestions for improvement/scaling

- Add user authentication
- Implement session expiration
- Add product search/filtering
- Introduce inventory management
- Add price tracking history
- Support group sessions (>2 users)
- Integrate product recommendations
- Add chat functionality
- Implement wishlists
- Develop admin dashboard

## PROJECT STRUCTURE
📦 Sippy Assessment
├── 📂 core
│   ├── 📂 errors
│   ├── 📂 extensions
│   ├── 📂 mixin
│   ├── 📂 routes
│   ├── 📂 theme
│   └── 📂 utils
│
├── 📂 data
│   └── 📂 repositories
│       ├── cart_repository_impl.dart
│       ├── firebase_cart_repository.dart
│       ├── product_repository_impl.dart
│       ├── product_repository_impl.freezed.dart
│       └── session_repository_impl.dart
│
├── 📂 domain
│   ├── 📂 entities
│   ├── 📂 failures
│   ├── 📂 repositories
│   ├── 📂 use_cases
│   └── 📂 value_object
│
├── 📂 presentation
│
├── 📂 providers
│   ├── cart_provider.dart
│   ├── firebase_providers.dart
│   ├── product_provider.dart
│   ├── repository_providers.dart
│   ├── session_provider.dart
│   └── shared_cartviewmodel_provider.dart
│
├── 📄 app.dart          
├── 📄 firebase_options.dart
├── 📄 providers.dart
└── 📄 main.dart         