# Certificate Setup Guide for TestDeploy100

This guide will help you set up your iOS certificates for GitHub Actions deployment.

## 📱 Required Certificates and Profiles

For deploying to TestFlight, you need:
1. **Distribution Certificate** (.p12 file)
2. **Provisioning Profile** (.mobileprovision file) for `com.example.testdeploy100`

## 🔐 Step 1: Prepare Your Certificates

Based on your Downloads folder, you have:
- `Certificates.p12` - Your distribution certificate

### Convert Certificate to Base64:
```bash
# For your distribution certificate
base64 -i ~/Downloads/Certificates.p12 | pbcopy
```
This copies the base64 encoded certificate to your clipboard.

### Create/Download Provisioning Profile:
1. Go to [Apple Developer Portal](https://developer.apple.com/account/resources/profiles/list)
2. Click the "+" button to create a new profile
3. Select "App Store" distribution
4. Select your app ID: `com.example.testdeploy100`
5. Select your distribution certificate
6. Name it (e.g., "TestDeploy100 Distribution")
7. Download the `.mobileprovision` file

### Convert Provisioning Profile to Base64:
```bash
# Replace with your actual provisioning profile filename
base64 -i ~/Downloads/TestDeploy100_Distribution.mobileprovision | pbcopy
```

## 🔑 Step 2: Add GitHub Secrets

Go to: https://github.com/RohitKumarr001/TestDeploy100/settings/secrets/actions

Add these secrets:

### Required Secrets:

| Secret Name | Value | Description |
|------------|-------|-------------|
| `APPLE_ID` | rohit@kahunas.io | ✅ Already have |
| `APP_SPECIFIC_PASSWORD` | sywe-tgou-rtlh-jnqz | ✅ Already have |
| `TEAM_ID` | Your Team ID | Find in Apple Developer Portal |
| `IOS_DIST_SIGNING_KEY` | (base64 encoded .p12) | Paste from clipboard |
| `IOS_DIST_SIGNING_KEY_PASSWORD` | Your .p12 password | Password for the certificate |
| `IOS_PROVISION_PROFILE` | (base64 encoded .mobileprovision) | Paste from clipboard |
| `KEYCHAIN_PASSWORD` | Any secure password | e.g., "TempKeychainPass123!" |

### How to Find Your TEAM_ID:
1. Go to https://developer.apple.com/account
2. Click "Membership" in the sidebar
3. Your Team ID is displayed (format: ABC123DEF)

## 🚀 Step 3: Deployment Options

You now have three options for code signing:

### Option 1: Manual Certificates (Current Setup)
- Uses the certificates you upload as GitHub Secrets
- Good for individual developers
- Requires manual updates when certificates expire

### Option 2: Automatic Signing (Simplest)
- Just need TEAM_ID
- Apple manages certificates automatically
- May have limitations for CI/CD

### Option 3: Match (Best for Teams)
- Stores certificates in a git repository
- Automatically syncs across team members
- Requires additional setup

## ✅ Verification

After adding all secrets, your next push to `main` branch will:
1. Import your certificates
2. Build the iOS app
3. Upload to TestFlight

## 🔧 Troubleshooting

If you encounter issues:

1. **Certificate not found**: Ensure the .p12 file includes both certificate and private key
2. **Profile doesn't match**: Make sure the provisioning profile is for the correct app ID and includes your certificate
3. **Team ID issues**: Verify you're using the correct Team ID from Apple Developer Portal

## 📝 Quick Commands Reference

```bash
# List certificates in Downloads
ls ~/Downloads/*.p12 ~/Downloads/*.mobileprovision

# Convert certificate to base64
base64 -i ~/Downloads/Certificates.p12 | pbcopy

# Convert provisioning profile to base64
base64 -i ~/Downloads/your_profile.mobileprovision | pbcopy

# Test certificate password (optional)
security unlock-keychain -p "your_password" ~/Downloads/Certificates.p12
