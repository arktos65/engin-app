# EngIn Application

This document provideesw an overview of the EngIn application for managing and reporting
on product development costs by value stream.  You will also find instructions for setting up
development and test environments.

**Requirements:** Ruby ~> v2.7.2, Rails ~> v6.1.6, MySQL Server ~> 8.0

## Development Prerequisites

The following prerequisites should be installed on your workstation before working on the
TGW API project:

* Ruby Version Manager (http://www.rvm.io/)
* MySQL Server CE (https://dev.mysql.com/downloads/)
* MySQL Workbench (optional)
* Editor or IDE (suggest RubyMine from JetBrains)
* HomeBrew (for MacOS)

### Setting Up Ruby Environment

These instructions assume you have installed the Ruby Version Manager on your workstation.  To install
Ruby:

    $ rvm install 2.7.2

RVM will install the Ruby interpreter.  It's good practice to use gemsets to keep various projects
separated to reduce the likelihood of Ruby gem version conflicts between your projects.  The following
snippet can be used to create your environment:

    $ rvm use 2.7.2
    $ rvm gemset create engin-app
    $ rvm use 2.7.2@engin-app
    $ gem install bundler

You can set your gemset to be the default by using the command:

    $ rvm use 2.7.2@engin-app --default

### Setting Up Development Project

Once you have your Ruby environment set up, it's time to download the source code and finish setting
things up. From the work directory where you plan to save the source code:

    $ git clone git@github.com:arktos65/engin-app.git
    $ cd engin-app
    $ bundle install
    $ brew install yarn

The previous commands clone a copy of the `engin-app` repository from Github to your local work
directory.  Then you change directory into the source code root directory and run `bundler` to
install all the required Ruby gems for the project.  The `Gemfile` provides the list of gems and
version constraints to be installed.

### Network local hosts

Edit your /etc/hosts file and add the following line:

    127.0.0.1 engin-db engin-redis.

### Initialize Database Environment

These instructions assume you're running MySQL as a containerized service defined in the project's
`docker-compose.yml` file..  Take a look at the `config/database.yml` file to see what you should
set your database credentials to.

From the root source code directory:

    $ rvm use 2.7.2@engin-app
    $ docker-compose up auth-db

Open a new terminal window and then:

    $ rvm use 2.6.6@tgw
    $ rails db:create db:migrate
    $ rails db:seed

You should see some messages starting with:

    Created database 'tgw-auth_development'
    Created database 'tgw-auth_test'
    Task seed:
     * [  ] User (seed)
     * [OK] User (seed)
     * [  ] Admin (seed)
     * [OK] Admin (seed)

This means your database environment has been successfully initialized.

### Test the Application

The final step is to verify everything works properly.  From the root source code directory:

    $ rails server

You should see:

    => Booting Puma
    => Rails 6.1.6 application starting in development
    => Run `bin/rails server --help` for more startup options
    Puma starting in single mode...
    * Puma version: 5.6.4 (ruby 2.7.2-p137) ("Birdie's Version")
    *  Min threads: 5
    *  Max threads: 5
    *  Environment: development
    *      PID: 38805
    * Listening on http://127.0.0.1:3000
    * Listening on http://[::1]:3000

Now open your web browser and type in `http://localhost:3000/`.  If the application is healthy, you should
see a login page.

    {
      "service":"TGW OAuth Service::API",
      "version":"0.3.1",
      "rails_version":"5.2.0",
      "ruby_version":"2.6.6",
      "database_connection":"OK",
      "timestamp":"2018-08-01T14:09:34.018-07:00"
    }

You can stop the application by pressing CTRL-C in the terminal window where it is running.

### User Login

The OAuth development environment is seeded with a user for testing purposes. You can login by
pointing your web browser at `http://localhost:3000/users/sign_in`.

**Development Credentials**

    Username: user@tgwconsulting.co
    Password: password123

These credentials are only available on your development instance.

### Admin Login

The OAuth development environment is seeded with an admin user for testing purposes.  You can
login by pointing your web browser at `http://localhost:3000/admins/sign_in`.

**Development Credentials**

    Username: admin@tgwconsulting.co
    Password: password123

These credentials are only available on your development instance.

### OAuth Applications

Admin users can manage OAuth applications registered with this provider by pointing your web
browser at `http://localhost:3000/oauth/applications`.

## Generating API Documentation

This project using `rswagger` for generating API developer documentation.  To update the documentation:

    rake rswag:specs:swaggerize

The documentation is accessible at `http://localhost:3000/api-docs`.

## Building a Docker Image

By design, when Github code is merged to the `master` branch, a build job is triggered on Azure DevOps to build
a Docker image from that branch and is pushed up to Docker Hub.  Code merged to the `stage` branch will automatically
produce a stage environment Docker image.

If you wish to manually build an image, use the following command from the project root directory:

    $ docker-compose build

The resulting image will be stored in your local Docker image repository.  The image will be titled
`tgwconsulting/tgw-oauth:latest`.

## Running Your Development Environment

This project uses Docker Compose making it very simple to start your development environment with all the
associated services in various containers.

Starting the TGW Auth service:

    $ cd <project_root>/helm
    $ helm install auth-service tgw-auth
    
    NAME: auth-service
    LAST DEPLOYED: Mon Nov  9 09:40:47 2020
    NAMESPACE: default
    STATUS: deployed
    REVISION: 1
    NOTES:
    1. Get the application URL by running these commands:

NOTE: It is common for the auth-server pods to restart once when installing the service because of timing issues
between the initialization of the `auth-db` pod.  The `auth-server` pods will recycle automatically.

To perform a graceful shutdown of your development environment:

    $ cd <project_root>/helm
    $ helm uninstall auth-service
    
    release "auth-service" uninstalled

### Testing OAuth Server

Once you have deployed the Rails application to your local Kubernetes cluster, you'll need to forward the port
to the `TGW-server` service.  This can be done with the command:

    $ kubectl port-forward deployment/auth-server 3000

Direct your web browser to `http://localhost:3000` to access the service.

### Examining a Docker Image

If you need to explore the contents of the Docker image, you may do so with the following command:

    $ docker run --rm -it --entrypoint=/bin/bash tgwconsulting/tgw-oauth

Docker will start a container with a `bash` shell.  This command is useful for checking service source code.

# Kubernetes Deployments

The TGW Auth and related services are containerized and can run in Docker or Kubernetes environments.  Kubernetes
deployments are managed by Helm charts.  Be sure to enable Kubernetes in your local Docker Desktop environment.

## Setting up Helm for Kubernetes

Helm is a tool for managing Charts. Charts are packages of pre-configured Kubernetes resources.

Use Helm to:

- Find and use popular software packaged as Helm Charts to run in Kubernetes
- Share your own applications as Helm Charts
- Create reproducible builds of your Kubernetes applications
- Intelligently manage your Kubernetes manifest files
- Manage releases of Helm packages

The source code to the Helm charts for this service are stored in the `helm` directory in the project root.

    helm repo add stable https://charts.helm.sh/stable

# License & Authors

- Author:: Sean M. Sullivan (<sean.sullivan@beatport.com>)

```text
Copyright:: 2022 Beatport, LLC.  All rights reserved.
```