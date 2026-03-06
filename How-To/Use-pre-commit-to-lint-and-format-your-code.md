# Use pre-commit to lint and format your code

The CCAO Data Team uses [pre-commit](https://pre-commit.com/) to enforce
common linting and formatting rules across our repos. This doc explains
how we use pre-commit, and provides some troubleshooting advice for
common problems that team members run into while using pre-commit.

## How pre-commit works

Pre-commit is a Python executable that can run "hooks", which are small
programs that encapsulate logic for different kinds of linting and
formatting checks. There is a robust ecosystem of third-party hooks that
encapsulate common linters and formatters like
[ruff](https://docs.astral.sh/ruff/) and [lintr](https://lintr.r-lib.org/).
You can think of pre-commit as an abstraction layer that sits on top of your
linters and formatters, grouping them all into one convenient command that you
can run to ensure all of your repo's automated checks run at the same time.

There are two main ways to run pre-commit:

- Using its command line interface, i.e. calling the command `pre-commit` in a
  terminal. This calls the Python executable directly, and allows you to
  customize pre-commit's behavior using a number of
  [command line options](https://pre-commit.com/#cli)
- Installing the checks as git hooks, so that they run every time you run
  `git commit` in the repo. This method does not allow the same flexibility as
  the command line interface, but it means that pre-commit will run
  automatically whenever you need it.

## How we use pre-commit

We run precommit in two ways: **locally** (i.e. directly on our personal computers)
and on **automated GitHub workflows** (i.e. on "continuous integration", or "CI").

- We run pre-commit **locally** whenever we are actively writing or editing code.
  Usually this means we have installed the git hooks so that pre-commit runs
  automatically whenever we commit code, but sometimes we will run the
  `pre-commit` command directly if we need to debug specific linting or
  formatting problems.
- Pre-commit runs automatically **on CI** whenever we push code to any of our
  repos, to make sure that all code is linted and formatted correctly before
  it gets merged into the main branch of a repo. We use a [composite
  action](https://github.com/ccao-data/actions/blob/main/pre-commit/action.yaml)
  to install and run the `pre-commit` executable, which reads a
  `.pre-commit-config.yaml` file in the repo that is calling the action in
  order to determine which hooks pre-commit needs to run. This action typically
  runs in a workflow that we configure to run on every commit to the main
  branch or to an open pull request. If any of the hooks fail, the composite
  action will fail the workflow, thereby alerting the code author to a problem
  with their code.

## Troubleshooting

There are a number of common issues that we run into while using pre-commit.
We document those issues below for the benefit of future maintainers.

### The `pre-commit` command errors when running R hooks in an RStudio terminal pane

The `pre-commit` command often seems to raise esoteric errors when run in the
context of an RStudio terminal pane. We have seen these errors in the past:

```
Error in packageVersion("precommit") : there is no package called ‘precommit’
```

```
Error in loadNamespace(x) : there is no package called ‘precommit’
```

```
installation of renv failed
===========================
ERROR: failed to lock directory ‘/home/your-user/.cache/pre-commit/repoabcdefg/renv-default/renv/library/linux-ubuntu-jammy/R-4.5/x86_64-pc-linux-gnu’ for modifying
```

The root causes of these errors are not entirely clear to us. The maintainer of
the pre-commit R hooks that we use [has mentioned in the
past](https://github.com/lorenzwalthert/precommit/issues/602#issuecomment-2564812342)
that RStudio sets some environment variables that collide with variables that
the R pre-commit hooks use, but [others have since
claimed](https://github.com/lorenzwalthert/precommit/issues/602#issuecomment-3536599363)
that recent releases have fixed this problem.

Regardless of the root cause, we have found that it is best to avoid running
the `pre-commit` command in an RStudio terminal pane. If you need to run the
`pre-commit` command directly, use a terminal session in a dedicated terminal
app, or open a terminal pane in a different editor like Positron or VSCode.

> [!NOTE]
> This problem should only affect users running the `pre-commit` command
> in an RStudio terminal pane. In our experience, the git hooks should run
> pre-commit without any issues if you use the RStudio git interface to
> commit changes.
