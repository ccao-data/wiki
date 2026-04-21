# Dev environment setup

These are the tools we expect every Data Team member to have set up on their
laptop, i.e. their dev environment.

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

Some of the following tools require [`sudo`](https://en.wikipedia.org/wiki/Sudo)
to install. If `sudo` is required, the tool command listed below will
include it. Using `sudo` will prompt you to input your WSL user password, which
should be the same as your Active Directory user password if you just received
your laptop. If you are using an old laptop on which you have already changed
your Active Directory password at least once, however, your WSL user password
will be the same as the Active Directory password you had set whenever WSL was
first installed on your machine. If you're having trouble remembering your
password, reach out to a senior staff member on the Data Team.

Many of these tools require WSL to install, so make sure IT has installed the
correct version of WSL for you before you start installing these tools.

### Mandatory tools

These tools are common across Data Team projects, so all Data Team members
should install them.

These tools must be installed in a WSL shell. The easiest way to open a

- [Python](https://www.python.org/) and [pip](https://pip.pypa.io/en/stable/):

```bash
sudo apt install python3-pip
```

- [uv](https://docs.astral.sh/uv/):

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

- [R](https://cran.r-project.org/bin/linux/ubuntu/fullREADME.html):

```bash
# 1. Download the CRAN signing key and output it to a file on your keyring
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo gpg --dearmor -o /usr/share/keyrings/cran-keyring.gpg

# 2. Make a new apt source and configure it to use the signing key
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/cran-keyring.gpg] https://cloud.r-project.org/bin/linux/ubuntu $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs)-cran40" | sudo tee /etc/apt/sources.list.d/cran.list

# 3. Refresh the package registry and install R
sudo apt update && sudo apt install r-base r-base-dev
```

- [Quarto](https://quarto.org/):

```bash
# 1. Download `.deb` file from the official Quarto site:
#    https://quarto.org/docs/download/index.html
#    The exact link will change depending on the latest Quarto version, so you
#    will need to update the variable definition below to set it to the correct
#    link
wget -qO quarto.deb "https://<insert-deb-file-url-here>"

# 2. Verify that the hash of the `.deb` file matches the hash listed on the
#    Quarto site (linked above)
sha256sum quarto.deb

# 3. If the hashes match, install the package
sudo dpkg -i quarto.deb

# 4. Remove the file you downloaded, now that `dpkg` has installed it
rm quarto.deb
```

- A number of system packages required for R development (copy and paste
  this whole block):

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
  libpng-dev libfontconfig1-dev libfreetype6-dev \
```

- Install the AWS CLI and set it up per [our
  instructions](How-To/Setup-the-AWS-Command-Line-Interface-and-Multi-factor-Authentication.md):

```bash
uv tool install awscli
uv tool install aws-mfa
```

- Install pre-commit and set it up per [our
  instructions](How-To/Use-pre-commit-to-lint-and-format-your-code.md#installing-pre-commit):

```bash
uv tool install pre-commit
```

### Optional tools

These tools are only used in specific Data Team projects, so Data Team members
do not need to install them unless they are responsible for maintaining that
project:

- [Terraform](https://developer.hashicorp.com/terraform) (only used in
  [`aws-infrastructure`](https://github.com/ccao-data/aws-infrastructure/)):

```bash
# 1. Download the package signing key and add it to your keyring
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# 2. Make a new apt source and configure it to use the signing key
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# 3. Refresh the package registry and install R
sudo apt update && sudo apt install terraform
```

- [Git LFS](https://github.com/git-lfs/git-lfs/blob/main/INSTALLING.md) (only
  used in [`ptaxsim`](https://github.com/ccao-data/ptaxsim/)):

```bash
(. /etc/lsb-release &&
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh |
sudo env os=ubuntu dist="${DISTRIB_CODENAME}" bash)
```

- Java Development Kit, required for R `tabulapdf` package (only used in
  [`ptaxsim`](https://github.com/ccao-data/ptaxsim/)):

```bash
sudo apt install default-jdk
```

- [`jq`](https://jqlang.org/) (only used in a handful of GitHub workflows for
  projects like
  [`data-architecture`](https://github.com/ccao-data/data-architecture/), so
  you only need it if you need to debug something it's doing in those
  workflows):

```bash
sudo apt install jq libjq-dev
```

- [Hugo](https://gohugo.io/) (only used in
  [`homeval`](https://github.com/ccao-data/homeval/)):

```bash
sudo snap install hugo
```

### Configurations

The following configs will help you work more productively:

- Create an `~/.Renviron` file with the following contents to use our default
  AWS settings:

```env
AWS_REGION=us-east-1
AWS_ATHENA_S3_STAGING_DIR=s3://ccao-athena-results-us-east-1/
```

- Create a [GitHub personal access token
  (PAT)](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)
  and add it to `~/.Renviron` to use when installing R packages from GitHub:
  - **⚠️ GitHub PATs are sensitive and should be treated like passwords.** We
    will give your token as few permissions as possible to reduce the attack
    surface, but you should still aim to keep it private and never publish it
    in source code.
  - Start by [generating a new classic personal access
    token](https://github.com/settings/tokens/new). Select **only** the
    `repo.public_repo` scope, hit "Generate token", and copy the PAT that
    GitHub displays to you.  /p
  - Paste your PAT onto a new line in your `~/.Renviron` file:

```env
GITHUB_PAT="<paste-your-PAT-here>"
```

- Create an `~/.Rprofile` file with the following contents:

```R
local({
    # Set the CRAN repo
    r <- getOption("repos")
    r["CRAN"] <- "https://cloud.r-project.org"
    options(repos = r)
    # Enforce the less verbose version of the renv lockfile syntax
    options(renv.lockfile.version = 1)
})
```
