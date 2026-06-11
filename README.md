# Shop With Family 🛒

> A collaborative real-time cart management Flutter app — share a link, 
> let family or friends add items, and even split the payment together.

Built as a personal project to explore deep linking, session-based 
state sharing, and advanced Riverpod patterns in Flutter.

---

## The Idea

Ever wanted to shop online with someone else in real time?

1. You open the app and start a cart session
2. You share a deep link — `myapp.com/session/abc123`
3. Your family member taps the link, joins your session instantly
4. You both see the same cart, add items, and can collaborate on 
   what to buy
5. Either person can initiate payment

No account sharing. No screenshots. No "can you add this for me?" 
messages. Just a shared live cart.

---

## Architecture

Clean Architecture with strict layer separation:

```
lib/
├── core/
│   ├── errors/          # Typed failure classes
│   ├── extensions/      # Dart extensions
│   ├── mixin/           # Dio networking mixin
│   ├── routes/          # AutoRoute configuration
│   ├── theme/           # App theme tokens
│   └── utils/
│
├── data/
│   └── repositories/    # Firebase + local implementations
│       ├── cart_repository_impl.dart
│       ├── firebase_cart_repository.dart
│       ├── product_repository_impl.dart
│       └── session_repository_impl.dart
│
├── domain/
│   ├── entities/        # Immutable models (Freezed)
│   ├── failures/        # Typed error domain
│   ├── repositories/    # Abstract interfaces
│   ├── use_cases/       # Single-responsibility business logic
│   └── value_objects/   # Validated domain primitives
│
└── presentation/
    └── providers/       # Riverpod providers + ViewModels
        ├── cart_provider.dart
        ├── session_provider.dart
        ├── product_provider.dart
        └── shared_cartviewmodel_provider.dart
```

---

## Key Engineering Highlights

### Session-Based Deep Linking
Each cart session gets a UUID. The session link encodes the ID:

```dart
AutoRoute(
  page: JoinSessionWithIdRoute.page, 
  path: '/session/:sessionId'
)
```

A `SessionGuard` validates the session before allowing entry into 
protected routes (`/products/:sessionId`, `/cart/:sessionId`), 
preventing invalid or expired links from causing bad state.

### Dependency Injection via Abstract Repositories
All data access goes through abstract repository interfaces defined 
in the domain layer. Concrete implementations (Firebase, local mock) 
are injected via Riverpod providers — swappable without touching 
business logic:

```dart
// Domain layer — abstract contract
abstract class CartRepository {
  Stream<Cart> watchCart(String sessionId);
  Future<void> addItem(String sessionId, CartItem item);
}

// Data layer — Firebase implementation
class FirebaseCartRepository implements CartRepository { ... }

// Presentation layer — injected via Riverpod
final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return FirebaseCartRepository(ref.watch(firestoreProvider));
});
```

### Mixin-Based Networking
A custom Dio mixin handles API calls cleanly across multiple 
repository classes without inheritance chains:

```dart
mixin ApiMixin {
  Dio get dio;
  
  Future<Either<Failure, T>> safeApiCall<T>(
    Future<T> Function() call
  ) async {
    try {
      return Right(await call());
    } on DioException catch (e) {
      return Left(NetworkFailure(e.message));
    }
  }
}
```

### Functional Error Handling (fpdart)
All repository methods return `Either<Failure, T>` — no uncaught 
exceptions, no null checks, explicit error paths at every layer:

```dart
Future<Either<Failure, List<Product>>> getProducts() async {
  return safeApiCall(() => _dio.get('/products'));
}
```

### Immutable State (Freezed)
All domain entities and UI state are immutable Freezed classes with 
`copyWith`, `==`, `hashCode`, and JSON serialization generated 
automatically:

```dart
@freezed
class Cart with _$Cart {
  const factory Cart({
    required String sessionId,
    required List<CartItem> items,
    required String hostUserId,
    DateTime? createdAt,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => 
    _$CartFromJson(json);
}
```

---

## Tech Stack

| Concern | Package |
|---|---|
| State management | `flutter_riverpod` |
| Routing + deep links | `auto_route` + Firebase Dynamic Links |
| Immutable models | `freezed` + `json_serializable` |
| Backend + auth | `firebase_auth` + `cloud_firestore` |
| Functional programming | `fpdart` (Either, Option) |
| HTTP client | `dio` (with custom mixin) |
| Environment config | `flutter_dotenv` |
| Sharing | `share_plus` |

---

## State Management Design

Three core ViewModels, each scoped to its domain:

```
SessionViewModel   — manages session lifecycle (create, join, expire)
CartViewModel      — shared cart operations (add, remove, sync)
ProductRepository  — product catalogue with local mock fallback
```

Riverpod's scoped providers mean cart state is automatically 
disposed when the session ends — no memory leaks, no stale state 
across sessions.

---

## What I'd Add Next

- [ ] Real payment split (Stripe or Paystack per-user checkout)
- [ ] True user authentication (currently session-based only)
- [ ] Session expiry + cleanup worker
- [ ] Product search and filtering
- [ ] Group sessions (more than 2 participants)
- [ ] In-session chat
- [ ] Push notifications when a family member adds an item
- [ ] Wishlist support

---

## Running Locally

```bash
# 1. Configure Firebase
# Add google-services.json (Android) and GoogleService-Info.plist (iOS)
# Set up Firebase project with Firestore + Auth + Dynamic Links

# 2. Configure environment
cp .env.example .env
# Add your API keys

# 3. Install dependencies
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Run
flutter run
```

---

## What This Project Demonstrates

- Clean Architecture in a real Flutter codebase — not just folder names
- Abstract repository pattern with runtime-swappable implementations
- Mixin-based code reuse without inheritance coupling
- Functional error handling with `fpdart` Either types
- Session-scoped Riverpod state with automatic disposal
- Deep link routing with route guards and dynamic path segments
- Real-time Firestore sync across multiple device sessions

---

*Personal project — not on the App Store. Built to explore advanced 
Flutter architecture patterns.*
