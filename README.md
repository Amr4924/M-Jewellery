<div align="center">

# 💎 M Jewellery

**A luxury jewellery shopping experience, built in Flutter.**

![Flutter](https://img.shields.io/badge/Flutter-3.44%2B-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.12%2B-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-informational?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-In%20Progress-yellow?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

*A mobile storefront concept for a jewellery brand — onboarding, authentication, a bilingual shop catalog, and a profile hub, all wrapped in a deep‑green‑and‑gold luxury theme.*

</div>

---

## ✨ Overview

**M Jewellery** is a Flutter mobile app concept for a jewellery brand. It's designed around the feeling of walking into a boutique: a cinematic animated intro, an elegant onboarding flow, and a shop experience that highlights featured pieces, exclusives, and offers.

The app currently ships as a **polished, fully local front-end** — every screen renders and flows correctly, and it's built to slot a real backend / auth service in later without a rewrite.

> 🧠 **Note:** This is an active work in progress. The core navigation, theming, Home tab, and shop UI are all in place; backend integration and cart/checkout logic are still on the roadmap. See [What's Next](#-whats-next) below.

---

## 🖼️ App Flow

```
Splash / Animated Intro  →  Onboarding  →  Login / Create Account  →  Main App (Bottom Nav)
                                                                          ├── Home
                                                                          ├── Shop
                                                                          └── Profile
```

---

## 🚀 Features

### ⚡ Performance & Architecture
- Reusable UI pieces (drawer, section titles, cards, banners, animated title, buttons) were refactored from plain **builder functions** into dedicated **`StatelessWidget` classes with `const` constructors**. This lets Flutter skip rebuilding unchanged branches of the widget tree instead of re-running a function on every parent rebuild.
- Large screens (**Login**, **Onboarding**, **Create Account**) were split from single monolithic `build()` methods into smaller composable widgets — so a local state change (e.g. toggling password visibility, a loading spinner) only rebuilds the piece that actually changed.
- A single shared `BuildDrawer` widget — with live user info (name/email/phone) pulled from `SaveRecord` and a working **Log Out** action — now backs Home, Shop, and Profile, replacing three separate hard-coded drawers.
- The onboarding splash now uses `AnimatedSwitcher` to transition between the loading screen and the page view instead of manual state-based rebuilding.
- The **Login** button now reflects real submit state: it validates against locally registered accounts, shows a loading spinner, and disables itself while "signing in" to prevent double taps.

### 🎬 Splash & Onboarding
- Animated typewriter-style intro with a gold shader gradient (`AnimatedTextKit` + `ShaderMask`) that sets the luxury tone before the user even taps anything.
- Onboarding `PageView` with a brand tagline and a **Get Started** CTA into the auth flow.

### 🏠 Home
- Full-width **banner ad / promo** section (e.g. "New Collection — The Royal Emerald") with rounded corners over a hero image.
- Horizontally scrollable **Featured Collections** carousel.
- **"The Art of Jewelry"** editorial showcase card, pairing an image with brand storytelling copy.
- A second, larger-format collections carousel styled as a "style guide" strip.
- **Notifications** screen accessible from a bell icon in the app bar, with a live unread-count badge, "mark all as read," and "clear all" actions — includes a welcome system message personalized with the signed-up user's name.

### 🔐 Authentication
- **Login** screen with form validation (empty fields, email format, password length) and a show/hide password toggle.
- **Create Account** screen with the same validation approach, wired to a lightweight local `UserModel` / `AuthManager`.
- Clean, reusable validation messaging — ready to be swapped for real backend error handling later.

### 🛍️ Shop
- **Featured Products** carousel at the top of the shop tab.
- **Exclusive** and **Offers** sections to spotlight promoted pieces.
- **Full Product Grid** with image, title, and price for every item — currently backed by a local mock dataset of 15+ jewellery pieces (rings, necklaces, bracelets).
- Cart icon in the app bar, ready to be connected to real cart logic.

### 👤 Profile
- Account summary card.
- Sectioned settings list (Account / Support) inspired by real e‑commerce apps: Manage Profile, Password & Security, Notifications, Help Center, Contact Us, Report a Problem, Privacy Policy.
- Slide-out drawer with **Log Out**.
- Dedicated **App Language** screen with an animated toggle switch.

### 🌍 Localization
- Full **English / Arabic** support out of the box via `easy_localization`, with every string (validation errors, nav labels, screen titles) translated in `assets/translations`.
- One-tap language switch that updates the whole app instantly, including text direction–sensitive layouts.

### 🎨 Branding & Theme
- Custom luxury palette — deep emerald green (`#0A2F1D`) and gold (`#C5A059`) — applied consistently across app bars, nav bar, and buttons.
- Custom typefaces: **Schyler** for the animated intro, **Playfair Display** for elegant serif headings.
- Centralized `AppColors` / `AppThemes` classes with light and dark theme definitions ready to go.

---

## 🛠️ Tech Stack

| Layer | Choice |
|---|---|
| Framework | Flutter (Dart SDK ^3.12.1) |
| State management | `StatefulWidget` + `setState` (local state, no backend yet) |
| Localization | [`easy_localization`](https://pub.dev/packages/easy_localization) |
| Animation | [`animated_text_kit`](https://pub.dev/packages/animated_text_kit), `ShaderMask`, `AnimatedContainer` |
| Data | Local mock lists (products, offers) — no API/database integration yet |
| Platforms | Android & iOS |

---

## 📁 Project Structure

```
lib/
├── main.dart                     # App entry point, localization + theme setup
├── mainScreen.dart                # Bottom navigation shell (Home / Shop / Profile)
├── feature/
│   ├── app_colors.dart            # Centralized color palette & ThemeData
│   └── change_language.dart       # Language toggle logic
├── on Bording Screen/
│   ├── onBordingScreen.dart         # Switches between loading screen and page view
│   └── widgets/
│       ├── loding_screen.dart       # Animated gold-gradient splash text
│       └── build_page_view.dart     # Welcome PageView + "Get Started" CTA
├── Sign in/
│   ├── login/
│   │   ├── login.dart              # Login screen (form + state)
│   │   └── widgets/                 # Login button (with loading state), forgot password, create-account link
│   ├── createAccount.dart          # Sign-up form + validation
│   └── Accounts.dart               # Local UserModel / AuthManager
├── nav bar/
│   ├── Home/
│   │   ├── Home.dart                # Home tab: banner, collections, art showcase
│   │   ├── Widgets/                 # App bar, banner ad, carousels, art card
│   │   └── notification/
│   │       └── notification.dart    # Notifications screen (badge, mark-read, clear)
│   ├── shop/
│   │   ├── shop.dart               # Shop tab: featured / exclusive / offers / grid
│   │   └── Widgets/                # Product cards, offer cards, carousels
│   └── Profile/
│       ├── profile.dart            # Profile tab + settings list
│       ├── Widgets/                 # Account card, section buttons
│       └── language screen/
│           └── language_screen.dart # Language switch UI
└── widgets/                        # Shared widgets: drawer, animated titles, section headers
```

---

## ⚙️ Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.44+ recommended)
- Dart SDK ^3.12.1
- Android Studio / Xcode (for emulator or physical device)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/Amr4924/M-Jewellery.git
cd M-Jewellery

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

### Building a release

```bash
flutter build apk     # Android
flutter build ios      # iOS
```

---

## 🗺️ What's Next

- [ ] Connect authentication to a real backend (Firebase / REST API) instead of the local mock `AuthManager`.
- [ ] Mark widget instances as `const` at the call site (e.g. `const BuildBanarAds()`) wherever no dynamic data is passed, to get the full benefit of the new const-constructor refactor.
- [ ] Cache network images (e.g. `cached_network_image`) across Home/Shop so scrolling doesn't re-decode full-resolution images on every rebuild.
- [ ] Wire up cart & checkout flow from the Shop tab.
- [ ] Add product detail pages (tap-through from cards).
- [ ] Persist user session and language preference across app restarts.
- [ ] Add automated widget tests.

---

## 🤝 Contributing

This is currently a solo learning/portfolio project, but suggestions and issues are always welcome — feel free to open an issue or fork the repo.

---

## 📄 License

This project is licensed under the MIT License — feel free to use it as a learning reference.

---

<div align="center">

**Built with 💚 and Flutter.**

</div>