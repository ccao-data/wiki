# Dev environment setup

This doc provides installation instructions for all of the tools you will need
if you want to write code on your CCAO-issued laptop. We call this set of tools
your "dev environment", and we sometimes refer to your laptop as your "local"
environment.

Your local dev environment is separate from [the Data Team
server](/How-To/Use-the-Data-team-server.md), though we also often use the
server to write code. None of the steps below are necessary in order to set up
your dev environment on the server, since we have already prepared the server
for programming tasks.

## Tools that IT needs to install

Make sure IT has installed the latest version of the following tools on your
laptop:

- Whichever major web browser you prefer
- [WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
  - WSL may come pre-installed on your laptop, but it's possible that
    the pre-installed version is not the correct one. To check whether you
    have the correct version installed, see if you can search for `WSL` in the
    Windows Search bar. If a WSL app shows up in the search results and you can
    open that app to load a terminal, then you have the correct version. If you
    don't see the WSL app, or if the app does not load a terminal when you open
    it, then you will need to contact IT to install the latest version of WSL.
- [Positron](https://positron.posit.co/)
  - We recommend you connect Positron to WSL so that you can take advantage of
    all of the Linux packages that we will help you install below. To do this,
    open [the Positron Remote menu](https://positron.posit.co/remote-ssh) and
    select the dropdown option "Connect to WSL".

## Tools that you can install yourself

The instructions below will help you install tools that _don't_ require
intervention from IT.

### A few notes before you begin

Some of the following tools require using the command
[`sudo`](https://en.wikipedia.org/wiki/Sudo) in order to authorize your OS
to perform the installation. If `sudo` is required to install a tool, then the
tool command listed below will include it.

Using `sudo` will prompt you to input your WSL user password, which
should be the same as your Active Directory user password if you just received
your laptop. If you are using an old laptop, and you've already changed your
Active Directory password at least once on that laptop, then your WSL user
password will be the same as the Active Directory password that was active
whenever IT first installed WSL on your laptop. If you're having trouble
remembering your password, reach out to a senior staff member on the Data Team.

Many of these tools require WSL to install, so make sure IT has installed the
correct version of WSL for you before you start installing these tools.

### Mandatory tools

These tools are common across Data Team projects, so all Data Team members
should install them.

These tools must be installed in a WSL shell. We recommend you do this in one
of two ways:

- **If you prefer using the terminal pane in your code editor of choice**:
  Connect your code editor to WSL and open a terminal pane. In Positron, you
  can do this by opening [the Remote
  menu](https://positron.posit.co/remote-ssh), selecting the WSL option, and
  then opening the terminal pane (`View > Terminal`).
- **If you prefer using a dedicated terminal app**: Open the `WSL` app on
  your laptop to launch a WSL shell.
  - If you prefer working in a terminal separate from your code editor, you can
    also take this opportunity to configure the built-in Windows Terminal app to
    launch WSL shells by default. See [the docs for configuring Windows
    Terminal](https://learn.microsoft.com/en-us/windows/terminal/install).
    Ignore any instructions related to installing Windows Terminal,
    since it should already be pre-installed on your laptop. (Feel free to skip
    this configuration step if you prefer to work in the terminal pane in your
    code editor.)

Once you have a WSL shell open, run the following commands to install mandatory
tools:

- Install [Python](https://www.python.org/) and
  [pip](https://pip.pypa.io/en/stable/):

```bash
sudo apt install python3-pip
```

- Install [uv](https://docs.astral.sh/uv/) for Python package management:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

- Install [R](https://cran.r-project.org/bin/linux/ubuntu/fullREADME.html):

```bash
# 1. Download the CRAN signing key and output it to a file on your keyring
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo gpg --dearmor -o /usr/share/keyrings/cran-keyring.gpg

# 2. Make a new apt source and configure it to use the signing key
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/cran-keyring.gpg] https://cloud.r-project.org/bin/linux/ubuntu $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs)-cran40" | sudo tee /etc/apt/sources.list.d/cran.list

# 3. Refresh the package registry and install R
sudo apt update && sudo apt install r-base r-base-dev
```

- Install [Quarto](https://quarto.org/) for authoring documents that run R or
  Python code
  - Note that there are two preliminary steps here:
    1. Find the link to the latest version of the `.deb` package file for
       Ubuntu on [the Quarto Downloads
       page](https://quarto.org/docs/download/index.html), then substitute that
       URL into command #1 below
    2. Copy the SHA-256 hash file hash for the `.deb` package that you
       downloaded, which should be displayed in the table on the Downloads
       page, and note it for comparison to the output of command #2 below

```bash
# 1. Download the `.deb` package file from the official Quarto site:
#    https://quarto.org/docs/download/index.html
#    The exact link will change depending on the latest Quarto version, so you
#    will need to update the variable definition below to set it to the correct
#    link
wget -qO quarto.deb "https://<insert-deb-file-url-here>"

# 2. Verify that the hash of the `.deb` file matches the hash listed on the
#    Quarto site (linked above)
sha256sum quarto.deb

# 3. If the hashes match, install the package; if hashes don't match, contact
#    a senior Data Team member for assistance, since the mismatch might indicate
#    a malicious package
sudo dpkg -i quarto.deb

# 4. Remove the file you downloaded, now that `dpkg` has installed it
rm quarto.deb
```

- Install a number of system packages that are necessary for R development
  (you can copy and paste this whole block to preserve the line breaks):

```bash
sudo apt install \
    # Required for R `curl` package
    libcurl4-openssl-dev \
    # Required for R `openssl` package
    libssl-dev \
    # Required for R `xml2` package
    libxml2-dev \
    # Required for R `git2r` package
    libgit2-dev \
    # Required for R `pdftools` package
    libpoppler-cpp-dev \
    # Required for R `protolite` package
    libprotobuf-dev protobuf-compiler \
    # Geospatial packages required for R `sf` package
    gdal-bin libudunits2-dev libgdal-dev libgeos-dev libproj-dev libsqlite3-dev \
    # Graphic devices required for tidyverse
    libpng-dev libfontconfig1-dev libfreetype6-dev
```

- Install the AWS CLI and set it up per [our
  instructions](How-To/Setup-the-AWS-Command-Line-Interface-and-Multi-factor-Authentication.md):

```bash
# Install the tools using these commands, then refer to the docs link above for
# the necessary configuration steps
uv tool install awscli
uv tool install aws-mfa
```

- Install pre-commit and set it up per [our
  instructions](How-To/Use-pre-commit-to-lint-and-format-your-code.md#installing-pre-commit):

```bash
# Install the tools using these commands, then refer to the docs link above for
# the necessary configuration steps
uv tool install pre-commit
```

### Mandatory R configurations

The following configs will help you work with our R projects.

- Create an `~/.Renviron` file with the following contents to use the correct
  AWS settings when [querying data from our AWS Athena data
  warehouse](https://github.com/ccao-data/wiki/blob/master/How-To/Connect-to-AWS-Resources.md#r):

```env
AWS_REGION=us-east-1
AWS_ATHENA_S3_STAGING_DIR=s3://ccao-athena-results-us-east-1/
```

- Create a [GitHub personal access token
  (PAT)](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)
  and add it to `~/.Renviron` to use when installing R packages from GitHub
  - **⚠️ GitHub PATs are sensitive and should be treated like passwords.** The
    instructions below will give your token as few permissions as possible in
    order to reduce the attack surface of the token, but you should still aim
    to keep it private, and you should definitely avoid including it in code
    that you push to GitHub.
  - Start by [generating a classic personal access
    token](https://github.com/settings/tokens/new). Select **only** the
    `repo.public_repo` scope, hit "Generate token", and copy the PAT that
    GitHub displays to you.
  - Paste your PAT onto a new line in your `~/.Renviron` file:

```env
GITHUB_PAT="<paste-your-PAT-inside-these-quotes>"
```

- Create an `~/.Rprofile` file with the following `local()` call to instruct
  renv to use the `cloud.r-project.org` CRAN mirror and the legacy lockfile
  syntax:

```R
local({
    # Set the CRAN repo
    r <- getOption("repos")
    r["CRAN"] <- "https://cloud.r-project.org"
    options(repos = r)
    # Enforce the less verbose (legacy) version of the renv lockfile syntax
    options(renv.lockfile.version = 1)
})
```

### Optional tools

These tools are only used in specific Data Team projects, so you do not need
to install them unless you are responsible for maintaining that project.

- Install [Terraform](https://developer.hashicorp.com/terraform) (only used in
  [`aws-infrastructure`](https://github.com/ccao-data/aws-infrastructure/)):

```bash
# 1. Download the package signing key and add it to your keyring
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# 2. Make a new apt source and configure it to use the signing key
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# 3. Refresh the package registry and install Terraform
sudo apt update && sudo apt install terraform
```

- Install [Git LFS](https://github.com/git-lfs/git-lfs/blob/main/INSTALLING.md)
  (only used in [`ptaxsim`](https://github.com/ccao-data/ptaxsim/)):

```bash
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo env os=ubuntu dist="$(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs)" bash
```

- Install the Java Development Kit, required for R `tabulapdf` package (only
  used in [`ptaxsim`](https://github.com/ccao-data/ptaxsim/)):

```bash
sudo apt install default-jdk
```

- Install [`jq`](https://jqlang.org/) (only used in a handful of GitHub
  workflows for projects like
  [`data-architecture`](https://github.com/ccao-data/data-architecture/), so
  you only need it if you need to debug a `jq` command in one of those
  workflows):

```bash
sudo apt install jq libjq-dev
```

- Install [Hugo](https://gohugo.io/) (only used in
  [`homeval`](https://github.com/ccao-data/homeval/)):

```bash
sudo snap install hugo
```
