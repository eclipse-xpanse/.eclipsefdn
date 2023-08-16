local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-xpanse') {
  settings+: {
    default_repository_permission: "none",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    members_can_change_repo_visibility: true,
    members_can_delete_repositories: true,
    name: "Eclipse Xpanse",
    packages_containers_internal: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
  },
  secrets+: [
    orgs.newOrgSecret('BOT_GITHUB_DOCKER_TOKEN') {
      value: "********",
    },
    orgs.newOrgSecret('ORG_GPG_PASSPHRASE') {
      value: "********",
    },
    orgs.newOrgSecret('ORG_GPG_PRIVATE_KEY') {
      value: "********",
    },
    orgs.newOrgSecret('ORG_GPG_PUBLIC_KEY') {
      value: "********",
    },
    orgs.newOrgSecret('ORG_OSSRH_PASSWORD') {
      value: "********",
    },
    orgs.newOrgSecret('ORG_OSSRH_USERNAME') {
      value: "********",
    },
  ],
  _repositories+:: [
    orgs.newRepo('terraform-boot') {
      allow_update_branch: false,
      description: "RESTful APIs for executing Terraform commands. ",
      homepage: "",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('xpanse') {
      allow_update_branch: false,
      description: "Xpanse is here to make native cloud services configurable and portable.",
      has_discussions: true,
      homepage: "https://eclipse.dev/xpanse/",
      topics+: [
        "cloud",
        "openapi",
        "rest-api",
        "saas"
      ],
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('BOT_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('GIST_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('MY_GITHUB_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          bypass_pull_request_allowances+: [
            "@eclipse-xpanse-bot"
          ],
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('xpanse-iam') {
      allow_update_branch: false,
      description: "Repository to host all IAM configurations for xpanse.",
      homepage: "",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
            bypass_pull_request_allowances+: [
                    "@eclipse-xpanse-bot"
                ],
                required_approving_review_count: 1,
                requires_status_checks: false,
                requires_strict_status_checks: true,
              },
            ],
    },
    orgs.newRepo('xpanse-relops') {
      allow_update_branch: false,
      description: "Release operations related material and artifacts such as SBOMs, release notes, test plans and reports, and other documentation.",
      homepage: "",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          bypass_pull_request_allowances+: [
            "@eclipse-xpanse-bot"
          ],
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('xpanse-ui') {
      allow_update_branch: false,
      description: "ReactJS based UI for Eclipse Xpanse project.",
      homepage: "",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('xpanse-website') {
      allow_update_branch: false,
      description: "Sourcecode for Eclipse Xpanse project website. Website is hosted using Github pages.",
      gh_pages_build_type: "workflow",
      homepage: "",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
  ],
}
