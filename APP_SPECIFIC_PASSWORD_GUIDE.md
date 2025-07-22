# How to Generate an App-Specific Password for Apple ID

An app-specific password is required for Fastlane to upload your app to TestFlight. This is a special password that allows third-party apps to access your Apple account securely.

## Steps to Generate App-Specific Password:

### 1. Sign in to Apple ID
- Go to https://appleid.apple.com/account/manage
- Sign in with your Apple ID (rohit@kahunas.io)

### 2. Navigate to Security Section
- Once logged in, find the **Security** section
- Look for **App-Specific Passwords**

### 3. Generate New Password
- Click on **Generate Password...** or the **+** button
- Enter a label for this password (e.g., "Fastlane CI/CD" or "TestDeploy100")
- Click **Create**

### 4. Copy the Password
- Apple will display a password in the format: `xxxx-xxxx-xxxx-xxxx`
- **IMPORTANT**: Copy this password immediately - you won't be able to see it again!
- This is the password you'll use for the `APP_SPECIFIC_PASSWORD` secret

## Important Notes:

- **Two-Factor Authentication Required**: You must have two-factor authentication enabled on your Apple ID to generate app-specific passwords
- **One-Time Display**: The password is only shown once. If you lose it, you'll need to revoke it and create a new one
- **Revoke When Needed**: You can revoke app-specific passwords at any time from the same Security section

## Adding to GitHub Secrets:

1. Go to your GitHub repository: https://github.com/RohitKumarr001/TestDeploy100
2. Navigate to **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add the secret:
   - Name: `APP_SPECIFIC_PASSWORD`
   - Value: The password you copied (e.g., `abcd-efgh-ijkl-mnop`)

## Security Best Practices:

- Never commit this password to your repository
- Only share it through secure channels if needed
- Revoke and regenerate if you suspect it's been compromised
- Use different app-specific passwords for different applications

## Troubleshooting:

If you can't generate an app-specific password:
1. Ensure two-factor authentication is enabled on your Apple ID
2. Check if you've reached the maximum number of app-specific passwords (you can have up to 25)
3. Try signing out and back into appleid.apple.com

For more information, visit: https://support.apple.com/en-us/HT204397
