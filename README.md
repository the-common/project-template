# The Common Project Template

A common project template to start of, batteries included.

<https://gitlab.com/the-common/project-template>

[![The GitLab CI pipeline status badge of the project's `main` branch](https://gitlab.com/the-common/project-template/badges/main/pipeline.svg?ignore_skipped=true "Click here to check out the comprehensive status of the GitLab CI pipelines")](https://gitlab.com/the-common/project-template/-/pipelines) [![The "Check potential problems in the project" GitHub Actions workflow status badge](https://github.com/the-common/project-template/actions/workflows/check-potential-problems.yml/badge.svg "Click here to check out the comprehensive status of the \"Check potential problems in the project\" GitHub Actions workflow")](https://github.com/the-common/project-template/actions/workflows/check-potential-problems.yml)

## How to use

### If you're on GitLab

1. Create a new project via [the on-site interface](https://gitlab.com/projects/new)
1. At localhost, launch a text terminal application, and run the following commands to clone the new project's repository to local:

    ```bash
    git clone \
        _repository_url_ \
        _project_dirctory_
    ```

1. Downloading a copy of [The Common Project Template](https://gitlab.com/the-common/project-template/-/releases) release archive
1. Extract The Common Project Template release archive to a temporary directory
1. Copy all the files to the new project local repository's working tree
1. Continue the operation in [Common instructions](#common-instructions)

### If you're on GitHub

1. Click the ["Use this template" green button](https://github.com/the-common/project-template/generate) on [the mirrored GitHub project page](https://github.com/the-common/project-template)
1. Follow the instructions on the webpage to create a new project
1. Continue the operation in [Common instructions](#common-instructions)

### Common instructions

1. Edit the [real.README.md project README template](real.README.md), replace the following `_placeholders_ to the appropriate content:
    + `_project_name_`
    + `_project_summary_`
    + `_namespace_/_project_`
    + `_license_name_`
    + `_license_url_`

    Also remove the unused `To be addressed` sections

1. Replace the `Upstream-Name`, `Upstream-Contact`, and `Source` field of the [.reuse/dep5 REUSE DEP5 machine-readable copyright declaration document](.reuse/dep5) with appropriate content(project name, project's issue tracker's title and URL, and project's site URL)
1. Replace [.markdownlint.yml](.markdownlint.yml) with [real.markdownlint.yml](real.markdownlint.yml)
1. Replace [README.md](README.md)(this document) with [real.README.md](real.README.md)
1. Customize/remove Telegram notification details in [.github/workflows/check-potential-problems.yml](.github/workflows/check-potential-problems.yml)
1. Commit all changes as a new revision(commit summary for reference: `docs: Write project README prototype`)
1. (If you've cloned the repository back to local) push local changes to the remote repository

## Licensing

Unless otherwise noted, this product is licensed under 4.0 International version of the [Creative Commons Attribution-ShareAlike license](https://creativecommons.org/licenses/by-sa/4.0/), or any of its recent versions you would prefer.

This work complies to the [REUSE Specification](https://reuse.software/spec/), refer [REUSE - Make licensing easy for everyone](https://reuse.software/) for info regarding the licensing of this product.
