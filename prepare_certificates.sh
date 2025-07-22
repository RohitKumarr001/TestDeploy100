#!/bin/bash

echo "🔐 Certificate Preparation Script for GitHub Actions"
echo "=================================================="
echo ""
echo "This script will help you prepare your certificates for GitHub Actions."
echo ""

# Check if certificates exist in Downloads
DOWNLOADS_DIR="$HOME/Downloads"

echo "📂 Looking for certificates in: $DOWNLOADS_DIR"
echo ""

# Find .p12 files
echo "Found the following certificate files:"
find "$DOWNLOADS_DIR" -name "*.p12" -o -name "*.cer" -o -name "*.mobileprovision" | head -20

echo ""
echo "📋 Instructions to use your certificates in GitHub Actions:"
echo ""
echo "1. First, you need to convert your certificates to base64:"
echo ""
echo "   For .p12 files (Development/Distribution certificates):"
echo "   base64 -i ~/Downloads/your_certificate.p12 | pbcopy"
echo ""
echo "2. Add these as GitHub Secrets:"
echo "   - Go to: https://github.com/RohitKumarr001/TestDeploy100/settings/secrets/actions"
echo "   - Add new repository secret:"
echo "     • Name: IOS_DIST_SIGNING_KEY"
echo "     • Value: (paste the base64 encoded certificate)"
echo ""
echo "   - Add another secret for the certificate password:"
echo "     • Name: IOS_DIST_SIGNING_KEY_PASSWORD"
echo "     • Value: (your certificate password)"
echo ""
echo "3. For provisioning profiles (.mobileprovision):"
echo "   base64 -i ~/Downloads/your_profile.mobileprovision | pbcopy"
echo ""
echo "   - Add as secret:"
echo "     • Name: IOS_PROVISION_PROFILE"
echo "     • Value: (paste the base64 encoded profile)"
echo ""
echo "4. We'll update the workflow to import these certificates"
echo ""
echo "⚠️  Note: Using Match is still recommended for team environments"
echo "    as it's easier to manage certificates across multiple developers."
