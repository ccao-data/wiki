# How to use the Data team server

## Contents

* [What is the Data team server?](#what-is-the-data-team-server)
* [Who controls the server?](#who-controls-the-server)
* [What lives on the server?](#what-lives-on-the-server)
* [How do I access the server?](#how-do-i-access-the-server)
* [How do I add or remove users from the server?](#how-do-i-add-or-remove-users-from-the-server)

## What is the Data team server?

The Data team server is a remote machine that we use to host various tools and services. It is an AWS EC2 instance running Ubuntu in the `us-east-1` region.

A sample of the types of things we use the server for include:

* Run RStudio and JupyterLab instances with more compute than we have on our laptops 
* Schedule cron jobs to perform ETL tasks
* Run web apps using Docker

These examples are intended to give you a high-level overview of the types of tools we host on the server. For more detail on the tools that are available on the server, see: [What's running on the server?](#what-is-running-on-the-server)

## Who controls the server?

The server is owned and maintained collectively by the Data team staff, but only a small group of Senior Data Scientists have superuser permissions (these users are `sudoers` in Linux terminology). If you need access to superuser permissions (to run commands that require `sudo`, for example), contact a Senior Data Scientist.

## What lives on the server?

The following is a list of tools and services that live on the server as of summer 2023:

| Path | Description | Repo | Run by |
| ---- | ----------- | ---- | ------ |
| `/home/<username>` | Home directories for each member of the data team | | |
| `/home/shiny-server/services` | Home directory for various apps that run on the server | | |
| `/home/shiny-server/services/service-sqoop-iasworld` | Service that extracts data from the iasWorld platform and loads it into AWS S3 | [`service-sqoop-iasworld`](https://github.com/ccao-data/service-sqoop-iasworld) | cron |
| `/home/shiny-server/services/service-socrata-ingress-agent` | Service that extracts data from AWS Athena and loads it into the Socrata data portal | [`service-socrata-ingress-agent`](https://github.com/ccao-data/service-socrata-ingress-agent) | systemd |
| `/home/shiny-server/services/service-watchtower` | Service that keeps Docker images up to date on the server | [`service-watchtower`](https://github.com/ccao-data/service-watchtower) | docker |
| `/home/shiny-server/services/service-nginx` | Service that directs web traffic to other services | [`service-nginx`](https://github.com/ccao-data/service-nginx) | docker |
| `/home/shiny-server/services/service-shiny-proxy` | Service that runs other services using Docker | [`service-shiny-proxy`](https://github.com/ccao-data/service-shiny-proxy) | docker |
| `/home/shiny-server/services/service-jupyterhub` | JupyterHub instance for running notebooks | [`service-jupyterhub`](https://github.com/ccao-data/service-jupyterhub) | systemd |
| `/home/shiny-server/services/api-res-avm` | REST API for getting predicted values from our residential model | [`api-res-avm`](https://github.com/ccao-data/api-res-avm) | docker |
| `/etc/crontab` | Cron job configuration | | cron |
| `/etc/systemd/system/` | systemd service configurations | | systemd |

If you add a new tool or service to the server, add it to this list and bump the date listed above.

## How do I access the server?

Ask a Senior Data Scientist to [create a user account for you on the server](https://github.com/ccao-data/wiki/blob/master/How-To/Administer-Users-on-CCAO-Services.md#data-server) if you don't have one already.

Once you have a user account, you can connect the server via SSH:

```
ssh $YOUR_USER@datascience.cookcountyassessor.com
```

This will prompt you to enter the password that was created for your account.

Once you've logged in for the first time, you can change your password by running the `passwd` command; you can also configure your account [to log in using an SSH key instead of a password](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-20-04) if you prefer. 

## How do I add or remove users from the server?

[See this document](https://github.com/ccao-data/wiki/blob/master/How-To/Administer-Users-on-CCAO-Services.md#data-server) for details.
