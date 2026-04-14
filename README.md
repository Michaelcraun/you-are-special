# YOU ARE SPECIAL

`you-are-special` is a SwiftUI companion app for browsing the Fallout 4 S.P.E.C.I.A.L. perk chart on iOS and macOS.

The app renders the seven S.P.E.C.I.A.L. attributes, loads perk metadata from a versioned JSON document, and fetches perk and attribute artwork from Firebase Storage. In debug builds, it also includes a document picker flow for importing and validating new version files before upload.

## Features

- Shared SwiftUI code for iOS and macOS targets
- Fallout 4 S.P.E.C.I.A.L. attribute and perk chart presentation
- Versioned perk data loaded from Firebase Storage
- Remote image loading for attributes and perks
- Debug-only JSON import flow for validating and uploading new data files
- Small bundled Fallout 4 sample dataset used as an initial in-memory fallback

## Project Structure

- [`Shared/`](/Users/michaelcraun/dev/Personal/you-are-special/Shared) contains shared models, services, view models, and SwiftUI views
- [`iOS/`](/Users/michaelcraun/dev/Personal/you-are-special/iOS) and [`macOS/`](/Users/michaelcraun/dev/Personal/you-are-special/macOS) contain platform-specific app resources
- [`Tests iOS/`](/Users/michaelcraun/dev/Personal/you-are-special/Tests%20iOS) and [`Tests macOS/`](/Users/michaelcraun/dev/Personal/you-are-special/Tests%20macOS) contain the current test targets
- [`_ref/`](/Users/michaelcraun/dev/Personal/you-are-special/_ref) contains reference assets and JSON used during development

## Tech Stack

- Swift
- SwiftUI
- Firebase Auth
- Firebase Storage
- Firebase Firestore
- Xcode project targets for iOS and macOS

## Data Model

The app centers on a versioned content model:

- `Version` groups a named game dataset and exposes the perk chart layout
- `Attribute` represents one S.P.E.C.I.A.L. attribute
- `Perk` stores perk requirements, rank progression, and image lookup paths

At launch, the app reads a saved version id from `UserDefaults` and requests `<version>.json` from Firebase Storage. The current default version id is `fo4`.

## Firebase Setup

This repo expects a Firebase project configured for the app bundle ids and includes a checked-in `GoogleService-Info.plist`.

For a fresh setup, confirm:

1. The Firebase app configuration matches your local bundle identifiers.
2. Firebase Storage contains:
   - `version/fo4.json` or another version file referenced by saved app state
   - `image/<version>/<name>.png` assets for attributes and perks
3. Anonymous authentication is enabled, since the app signs in anonymously on startup.

## Running The App

1. Open [`you-are-special.xcodeproj`](/Users/michaelcraun/dev/Personal/you-are-special/you-are-special.xcodeproj).
2. Choose the `iOS` or `macOS` target.
3. Build and run from Xcode.

If Firebase data is unavailable, the app still initializes with a small bundled Fallout 4 sample model, but the main setup path fetches the full version payload from Firebase Storage.

## Importing New Version Data

In debug builds, the toolbar exposes a JSON document picker on iOS. Imported files are:

1. Decoded into the `Version` model.
2. Validated to ensure the dataset contains all seven S.P.E.C.I.A.L. attributes and a consistent perk progression structure.
3. Uploaded to Firebase Storage under the `version/` path.

The reference file [`_ref/fo4.json`](/Users/michaelcraun/dev/Personal/you-are-special/_ref/fo4.json) appears to be the intended source format for a full Fallout 4 dataset.

## Tests

Current test coverage is light:

- iOS tests include a perk chart sanity check against the bundled Fallout 4 sample data.
- macOS tests are still close to the default Xcode UI test template.

## Notes

- The bundled Fallout 4 data in [`Shared/Model/Default Data/Fallout4.swift`](/Users/michaelcraun/dev/Personal/you-are-special/Shared/Model/Default%20Data/Fallout4.swift) is only a partial sample, not the full game dataset.
- The document picker implementation is UIKit-based, so the import flow is currently oriented around the iOS target.
