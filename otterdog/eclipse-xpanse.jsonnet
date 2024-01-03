local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-xpanse') {
  settings+: {
    blog: "https://eclipse.dev/xpanse",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Xpanse enables the development of native cloud managed services designed to be fully portable across cloud implementations, for an  open and fair cloud market.",
    name: "Eclipse Xpanse",
    packages_containers_internal: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  secrets+: [
    orgs.newOrgSecret('BOT_GITHUB_DOCKER_TOKEN') {
      value: "pass:bots/technology.xpanse/github.com/api-token-3388",
    },
    orgs.newOrgSecret('ORG_GPG_PASSPHRASE') {
      value: "pass:bots/technology.xpanse/gpg/passphrase",
    },
    orgs.newOrgSecret('ORG_GPG_PRIVATE_KEY') {
      value: "pass:bots/technology.xpanse/gpg/secret-subkeys.asc",
    },
    orgs.newOrgSecret('ORG_GPG_PUBLIC_KEY') {
      value: "pass:bots/technology.xpanse/gpg/public-keys.asc",
    },
    orgs.newOrgSecret('ORG_OSSRH_PASSWORD') {
      value: "pass:bots/technology.xpanse/oss.sonatype.org/password",
    },
    orgs.newOrgSecret('ORG_OSSRH_USERNAME') {
      value: "pass:bots/technology.xpanse/oss.sonatype.org/username",
    },
    orgs.newOrgSecret('SWAGGERHUB_API_KEY') {
      value: "pass:bots/technology.xpanse/swaggerhub.com/api-key",
    },
    orgs.newOrgSecret('SWAGGERHUB_USER') {
      value: "pass:bots/technology.xpanse/swaggerhub.com/username",
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Repo to maintain organization home page content.",
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('policy-man') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "OPA based policy engine.",
      homepage: "",
      topics+: [
        "opa",
        "restful"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      secrets: [
        orgs.newRepoSecret('BOT_GITHUB_TOKEN') {
          value: "pass:bots/technology.xpanse/github.com/api-token-3208",
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
    orgs.newRepo('terraform-boot') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "RESTful APIs for executing Terraform commands. ",
      homepage: "",
      topics+: [
        "rest-api",
        "spring-boot",
        "terraform"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      secrets: [
        orgs.newRepoSecret('BOT_GITHUB_TOKEN') {
          value: "pass:bots/technology.xpanse/github.com/api-token-3208",
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
    orgs.newRepo('xpanse') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "xpanse is here to make native cloud services configurable and portable.",
      has_discussions: true,
      homepage: "https://eclipse.dev/xpanse/",
      topics+: [
        "cloud",
        "containers",
        "openapi",
        "rest-api",
        "saas",
        "spring-boot"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      secrets: [
        orgs.newRepoSecret('BOT_GITHUB_TOKEN') {
          value: "pass:bots/technology.xpanse/github.com/api-token-3208",
        },
        orgs.newRepoSecret('GIST_TOKEN') {
          value: "pass:bots/technology.xpanse/github.com/gist-token-3285",
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Repository to host all IAM configurations for xpanse.",
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
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
    orgs.newRepo('xpanse-observability') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "xpanse observability and traceability related configuration.",
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Release operations related material and artifacts such as SBOMs, release notes, test plans and reports, and other documentation.",
      homepage: "",
      topics+: [
        "devops",
        "documentation",
        "tests"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "ReactJS based UI for Eclipse Xpanse project.",
      homepage: "",
      topics+: [
        "antd-design",
        "reactjs",
        "typescript",
        "ui"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      secrets: [
        orgs.newRepoSecret('BOT_GITHUB_TOKEN') {
          value: "pass:bots/technology.xpanse/github.com/api-token-3208",
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
    orgs.newRepo('xpanse-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Sourcecode for Eclipse Xpanse project website. Website is hosted on Eclipse Foundation's infrastructure.",
      gh_pages_build_type: "workflow",
      homepage: "",
      topics+: [
        "docusaurus",
        "typescript",
        "website-development"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
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
