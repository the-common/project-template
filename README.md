# The Common Project Template

A common project template to start of, batteries included.

<https://gitlab.com/the-common/project-template>  
[![The GitLab CI pipeline status badge of the project's `main` branch](https://gitlab.com/the-common/project-template/badges/main/pipeline.svg?ignore_skipped=true "Click here to check out the comprehensive status of the GitLab CI pipelines")](https://gitlab.com/the-common/project-template/-/pipelines) [![The "Check potential problems in the project" GitHub Actions workflow status badge](https://github.com/the-common/project-template/actions/workflows/check-potential-problems.yml/badge.svg "Click here to check out the comprehensive status of the \"Check potential problems in the project\" GitHub Actions workflow")](https://github.com/the-common/project-template/actions/workflows/check-potential-problems.yml) [![pre-commit enabled badge](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white "This project uses pre-commit to check potential problems")](https://pre-commit.com/) [![REUSE Specification compliance badge](https://api.reuse.software/badge/gitlab.com/the-common/project-template "This project complies to the REUSE specification to decrease software licensing costs")](https://api.reuse.software/info/gitlab.com/the-common/project-template)

## How to use

### If you're on GitLab

1. Create a new project via [the on-site interface](https://gitlab.com/projects/new), it is required to check the "Initialize repository with a README" checkbox.
1. At localhost, launch a text terminal application, and run the following commands to clone the new project's repository to local:

    ```bash
    git clone \
        _repository_url_ \
        _project_directory_
    ```

1. Downloading a copy of [The Common Project Template release archive](https://gitlab.com/the-common/project-template/-/releases)
1. Extract The Common Project Template release archive to a temporary directory
1. Copy all the files to the new project local repository's working tree
1. Continue the operation in [Common instructions](#common-instructions)

### If you're on GitHub

1. Click the ["Use this template" green button](https://github.com/the-common/project-template/generate) on [the mirrored GitHub project page](https://github.com/the-common/project-template)
1. Follow the instructions on the webpage to create a new project
1. In the Settings > Actions > Workflow permissions panel, ensure that "Read and write permissions" option is selected to allow [the "Release product and their build aritfacts" GitHub Actions workflow] to be able to write built artifacts to the releases page.
1. Continue the operation in [Common instructions](#common-instructions)

### Common instructions

1. Rename the following files:
    + [real.README.md](real.README.md)→README.md
    + [real.markdownlint.yml](real.markdownlint.yml)→.markdownlint.yml
1. Edit the [README.md project README template](real.README.md), replace the following `_placeholders_ to the appropriate content:
    + `_project_name_`  
      The (display) name of the project.
    + `_project_summary_`  
      A one-line summary of the project.
    + `_namespace_/_project_`  
      The variable part of the project URL, you use another project hosting service you need to manually replace the entire URL instead.
    + `_license_name_`  
      The name of the main license of the project.
    + `_license_url_`  
      the URL of the main license of the project.
1. Replace the `project-name` placeholder text in [the docker-compose.yml Docker Compose configuration file](docker-compose.yml) to your project's hostname-friendly name.
1. Customize/remove Telegram notification details in [.github/workflows/check-potential-problems.yml](.github/workflows/check-potential-problems.yml)
1. Run the following commands(or its equivalent operation) to remove the template-only custom license:

    ```bash
    find_opts=(
        -type f
        -exec
            sed
                --in-place
                --regexp-extended
                --expression='s@ OR LicenseRef-Apache-2.0-If-Not-Used-In-Template-Projects@@g'
                {}
                ';'
    )
    find . "${find_opts[@]}"
    rm -f LICENSES/LicenseRef-Apache-2.0-If-Not-Used-In-Template-Projects.txt
    ```

1. Commit all changes as a new revision(commit summary for reference: `docs: Write project README prototype`)
1. (If you've cloned the repository back to local) push local changes to the remote repository

## Licensing

Unless otherwise noted([comment headers](https://reuse.software/spec-3.3/#comment-headers)/[REUSE.toml](https://reuse.software/spec-3.3/#reusetoml)), this product is licensed under [the 4.0 International version of the Creative Commons Attribution-ShareAlike license](https://creativecommons.org/licenses/by-sa/4.0/), or any of its more recent versions of your preference.

As an exception of the previous clause, this product can be licensed otherwise under [the 2.0 version of the Apache license](https://www.apache.org/licenses/LICENSE-2.0) _if_ it is used to instantiate/refactor a project based on it rather than using it in the making of another template project.  This allows relicensing the project assets to your liking in your non-template projects with only a conformance requirement of attributing this product somewhere in your project/product credits/acknowledgment/copyright notice documentation/user interface.

This work complies to [the REUSE Specification](https://reuse.software/spec/), refer to the [REUSE - Make licensing easy for everyone](https://reuse.software/) website for info regarding the licensing of this product.
