#!/bin/bash
set -euo pipefail

# Create an info annotation
echo -e "# Project Information\n\nThis is an info-style annotation that provides general information about the build.\n\n- Repository: example-app\n- Branch: main\n- Commit: abc123\n" | buildkite-agent annotate --style info --context "info-annotation"

# Create a warning annotation
echo -e "# Build Warnings\n\n⚠️ **Warning:** Some tests were skipped during this build.\n\n\`\`\`\nSkipped tests:\n- TestFeatureX: Feature not implemented yet\n- TestEdgeCase: Needs further investigation\n\`\`\`\n" | buildkite-agent annotate --style warning --context "warning-annotation"

# Create an error annotation
echo -e "# Build Errors\n\n❌ **Error:** Failed to deploy to production environment.\n\n\`\`\`term\nError log:\nConnection refused: \033[0;31mproduction-server:22\033[0m\nTimeout after 60 seconds\n\`\`\`\n\nPlease check server availability and try again.\n" | buildkite-agent annotate --style error --context "error-annotation"

# Create a success annotation with markdown formatting
echo -e "# Build Summary\n\n✅ **Build successful!**\n\n## Details\n\n| Metric | Value |\n|--------|-------|\n| Build Time | 2m 34s |\n| Tests Run | 245 |\n| Test Coverage | 87% |\n\n![![Build status](https://badge.buildkite.com/7abe759d586dd13653c7be3127ad56be692d2010dd6480a575.svg)](https://buildkite.com/bretts-shoe-store/03-annotations)\n\n> Deployment completed successfully to staging environment.\n\n## Next Steps\n\n1. Review the changes in the [staging environment](https://staging.example.com)\n2. Approve the deployment to production\n3. Monitor application metrics after deployment\n\n\`\`\`bash\n# To deploy to production\nbuildkite-agent pipeline upload .buildkite/deploy-production.yml\n\`\`\`\n" | buildkite-agent annotate --style success --context "success-annotation"

echo "All annotations created successfully!"
