## Introduction

This demo will show you how to use [GCP Secret Manager](https://cloud.google.com/security/products/secret-manager) to inject secrets into your development and preview environments.

## Give Your Okteto Instance Access to Your GCP Account

1. [Create a dedicated service account](https://cloud.google.com/iam/docs/service-accounts-create) for your Okteto instance. We recommend granting it the minimum set of required permissions for security. This demo requires access to the `Secret Manager Secret Accessor` role.
2. [Create a service key for the account](https://cloud.google.com/iam/docs/keys-create-delete) and save it locally.
3. Create the following [admin variables](https://www.okteto.com/docs/core/okteto-variables/#admin-variables) in your Okteto instance:
    - `GCP_PROJECT_ID`: *the ID of the GCP Project you are using*
    - `GCP_SERVICE_KEY`: *the base64 value of the service token you created*

With this setup, your development and preview environments will be able to manage GCP resources as part of their lifecycle.

## Create Your Secret

For this demo, we will store an `.env` file in GCP Secret Manager that contains two pieces of secret information: our name and our favorite color.

1. Create a secret in GCP Secret Manager named "top-secret-information."
2. Fill the `Secret Value` section with the following content (feel free to put your secret information):

    ```env
    MY_NAME=cindy
    MY_COLOR=valencia green
    ```

## Deploy Your Development Environment

Once everything is configured, deploy your development environment either via the UI or by cloning the repository locally and running `okteto deploy`.

When you deploy your environment, Okteto will:
- Build the container image
- Download the secrets
- Create the `.env` file
- Deploy your application in your namespace

Once the environment is deployed, go to the Okteto UI and click on the endpoint that Okteto created for you. The output will be similar to this:

```
Hi, my name is cindy, and my favorite color is valencia green.
```