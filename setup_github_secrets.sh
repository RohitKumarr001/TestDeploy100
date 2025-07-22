#!/bin/bash

echo "🔐 GitHub Secrets Setup Helper for TestDeploy100"
echo "=============================================="
echo ""
echo "This script will help you prepare and add secrets to your GitHub repository."
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}📋 Required Secrets Summary:${NC}"
echo ""
echo "Based on your workflow example, here are the values you need:"
echo ""

echo -e "${GREEN}✅ Already Known Values:${NC}"
echo "  TEAM_ID: H8RQNJB8B4"
echo "  APPLE_ID: rohit@kahunas.io"
echo "  APP_SPECIFIC_PASSWORD: sywe-tgou-rtlh-jnqz"
echo ""

echo -e "${YELLOW}📱 iOS Certificate Setup:${NC}"
echo ""
echo "1. Convert your distribution certificate to base64:"
echo "   ${GREEN}base64 -i ~/Downloads/Certificates.p12 | pbcopy${NC}"
echo "   Then add as: IOS_DIST_SIGNING_KEY"
echo ""
echo "2. Certificate password: IOS_DIST_SIGNING_KEY_PASSWORD"
echo ""
echo "3. Convert provisioning profile to base64:"
echo "   ${GREEN}base64 -i ~/Downloads/Flutter.mobileprovision | pbcopy${NC}"
echo "   Then add as: IOS_PROVISION_PROFILE"
echo ""
echo "4. Keychain password: KEYCHAIN_PASSWORD (any password, e.g., 'TempKey123!')"
echo ""

echo -e "${YELLOW}🔑 App Store Connect API (Optional but Recommended):${NC}"
echo ""
echo "If you want to use API key authentication instead of Apple ID:"
echo "1. Go to https://appstoreconnect.apple.com/access/api"
echo "2. Create a new key with 'App Manager' role"
echo "3. Download the .p8 file (only downloadable once!)"
echo "4. Note the Key ID and Issuer ID"
echo "5. Convert to base64: ${GREEN}base64 -i ~/Downloads/AuthKey_XXXXX.p8 | pbcopy${NC}"
echo ""

echo -e "${YELLOW}🤖 Android Firebase Setup:${NC}"
echo ""
echo "1. Get Firebase token:"
echo "   ${GREEN}firebase login:ci${NC}"
echo ""
echo "2. Get Android App ID from Firebase Console"
echo "3. Set testers emails (comma-separated)"
echo ""

echo -e "${RED}⚠️  Important:${NC}"
echo "Add all secrets at: https://github.com/RohitKumarr001/TestDeploy100/settings/secrets/actions"
echo ""

echo -e "${GREEN}📝 Quick Copy Commands:${NC}"
echo ""
echo "# List your certificates:"
echo "ls -la ~/Downloads/*.p12 ~/Downloads/*.mobileprovision"
echo ""
echo "# Base64 encode certificate:"
echo "base64 -i ~/Downloads/Certificates.p12 | pbcopy"
echo ""
echo "# Base64 encode provisioning profile:"
echo "base64 -i ~/Downloads/Flutter.mobileprovision | pbcopy"
echo ""

echo -e "${YELLOW}🚀 After adding all secrets, push any change to trigger deployment!${NC}"
