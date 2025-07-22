# Flutter App Deployment with Fastlane and GitHub Actions

This project is configured for automated deployment to TestFlight (iOS) and Firebase App Distribution (Android) using Fastlane and GitHub Actions.

## 📋 Prerequisites

1. **Apple Developer Account** (for iOS deployment)
2. **Firebase Project** with App Distribution enabled
3. **GitHub repository** with Actions enabled
4. **Match repository** for iOS code signing certificates (private Git repo)

## 🔧 Setup Instructions

### 1. iOS Setup

#### App Store Connect
1. Create your app in App Store Connect
2. Generate an app-specific password:
   - Go to https://appleid.apple.com/account/manage
   - Sign in and navigate to Security
   - Under "App-Specific Passwords", click "Generate Password"
   - Name it (e.g., "Fastlane CI/CD")
   - Save the generated password

#### Match Setup (Code Signing)
1. Create a private Git repository for certificates (e.g., `certificates` repo)
2. Initialize Match locally:
   ```bash
   cd ios
   bundle install
   bundle exec fastlane match init
   ```
3. Follow the prompts to set up Match with your certificates repo

### 2. Android Setup

#### Firebase Setup
1. Create a Firebase project at https://console.firebase.google.com
2. Add your Android app to the project
3. Enable App Distribution in the Firebase console
4. Get your Firebase CLI token:
   ```bash
   firebase login:ci
   ```
5. Save the generated token
6. Get your Firebase Android App ID from Firebase Console → Project Settings

### 3. GitHub Secrets Configuration

Add the following secrets to your GitHub repository (Settings → Secrets → Actions):

| Secret Name | Description | Example |
|------------|-------------|---------|
| `APPLE_ID` | Your Apple ID email | `developer@example.com` |
| `APP_SPECIFIC_PASSWORD` | App-specific password from Apple ID | `xxxx-xxxx-xxxx-xxxx` |
| `FIREBASE_TOKEN` | Firebase CLI token | `1//0abc...xyz` |
| `FIREBASE_ANDROID_APP_ID` | Firebase Android App ID | `1:123456789:android:abcdef` |
| `FIREBASE_TESTERS` | Comma-separated tester emails | `test1@example.com,test2@example.com` |
| `XCODEPROJ` | Xcode project file name | `Runner.xcodeproj` |
| `SCHEME` | Xcode scheme name | `Runner` |
| `MATCH_GIT_URL` | URL to your certificates repo | `https://github.com/org/certificates.git` |
| `MATCH_PASSWORD` | Password for Match encryption | `your-secure-password` |

### 4. Local Testing

#### iOS Local Deployment
```bash
cd ios
bundle install
bundle exec fastlane ios beta
```

#### Android Local Deployment
```bash
cd android
bundle install
bundle exec fastlane android beta
```

### 5. Bundle Identifiers

Make sure to update the bundle identifiers in:
- **iOS**: `ios/Runner.xcodeproj` → Update bundle identifier to match your App Store Connect app
- **Android**: `android/app/build.gradle` → Update `applicationId`
- **Fastlane**: Update `ios/fastlane/Appfile` and `android/fastlane/Appfile`

## 🚀 Deployment Process

1. **Automatic Deployment**: Push to the `main` branch triggers deployment to both platforms
2. **iOS**: Builds and uploads to TestFlight
3. **Android**: Builds APK and distributes via Firebase App Distribution

## 📁 Project Structure

```
test_deploy_100/
├── .github/
│   └── workflows/
│       └── deploy.yml          # GitHub Actions workflow
├── ios/
│   ├── fastlane/
│   │   ├── Fastfile           # iOS deployment lanes
│   │   └── Appfile            # iOS app configuration
│   └── Gemfile                # Ruby dependencies for iOS
├── android/
│   ├── fastlane/
│   │   ├── Fastfile           # Android deployment lanes
│   │   ├── Appfile            # Android app configuration
│   │   └── Pluginfile         # Fastlane plugins
│   └── Gemfile                # Ruby dependencies for Android
└── .env.example               # Example environment variables
```

## 🔍 Troubleshooting

### iOS Issues
- **Code signing errors**: Ensure Match is properly configured and certificates are valid
- **Upload failures**: Verify app-specific password and Apple ID are correct
- **Build failures**: Check Xcode project settings and ensure scheme exists

### Android Issues
- **Firebase token expired**: Regenerate with `firebase login:ci`
- **APK not found**: Ensure Flutter build completes successfully
- **Distribution failures**: Verify Firebase App ID and tester emails

### General Issues
- **Workflow not triggering**: Ensure you're pushing to the `main` branch
- **Secret not found**: Double-check secret names in GitHub settings
- **Ruby/Bundler issues**: Try `bundle update` in the respective directory

## 📚 Additional Resources

- [Fastlane Documentation](https://docs.fastlane.tools/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Firebase App Distribution](https://firebase.google.com/docs/app-distribution)
- [TestFlight Documentation](https://developer.apple.com/testflight/)
- [Match Documentation](https://docs.fastlane.tools/actions/match/)

## 🔐 Security Notes

- Never commit `.env` files or secrets to version control
- Use GitHub Secrets for all sensitive information
- Rotate app-specific passwords periodically
- Keep your Match repository private
