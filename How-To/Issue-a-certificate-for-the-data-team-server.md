The Data team uses an X.509 TLS certificate signed by the CCAO's domain
controller to provide HTTPS for its internal server. This certificate
occassionally needs to be manually renewed by an administrative or IT staff
member. This guide walks through how to create/renew the certificate.

> [!WARNING]  
> This process involves some confusing steps, and must take place after hours
> so as not to disrupt users of the Data Team server. Try to perform this
> renewal at least a week in advance of the certificate expiration so that
> you can work with IT to resolve any issues that may arise.

## Create a certificate

1. Open the Certificate Manager app by pressing `Windows + R`, then typing
`certmgr.msc`.
2. Click the arrow next to the **Personal** directory on the sidebar, then
select the **Certificates** directory.
3. Right-click the **Certificates** directory, then click
**All Tasks > Request New Certificate**.
4. Click **Next**, keep `Active Directory Enrollment Policy` selected, then
click **Next** again.
5. Under `Active Directory Enrollment Policy`, select `CCAO WEB2`, click the
**Details** down arrow to the right of the policy, then click **Properties**.
    - If you have never renewed this certificate before, you may not see the
      `CCAO WEB2` certificate template in the "Request Certificates" menu,
      or you may get a generic error saying you don't have permission to
      request certificates at all. In either of these cases, reach out to IT
      to ask them to give you permissions to request certificates using the
      `CCAO WEB2` certificate template.
6. On the **General** tab of the popup, make the friendly name the name of the server
`datascience.cookcountyassessor.com`.
7. Switch to the **Subject** tab, under the `Subject name` field, select
`Common name` and add a value of `datascience.cookcountyassessor.com`, then
click the **Add >** button.
8. Repeat the process of adding `Subject name` values for the following:
    - `Country`: US
    - `State`: Illinois
    - `Locality`: Chicago
    - `Email`: Email of whoever is making the cert
    - `Organization`: Cook County Assessor's Office
    - `Organization unit`: Data Department
9. Under the `Alternative name` field, select `DNS` and add a value of
`datascience.cookcountyassessor.com`, then click the **Add >** button.
10. Switch to the **Private Key** tab. Under **Key options**, check the box
for `Make private key exportable`.
11. Hit **Apply** in the bottom right of the popup. Then click **Enroll** to
create the new certificate.
12. Click **Finish** to return to the Certificate Manager. You should see
your new certificate in the list.

## Export the certificate

Now that the certificate is created, we need to export it for NGINX. To do so:

1. Right-click the newly created certificate, then click
**All Tasks > Export**. Click **Next**.
2. Select `Yes, export the private key` option, then click **Next**.
3. Select `Export all extended properties`. Leave all of the
other options set to their defaults. Then, click **Next**.
5. Select the `Password` option, enter an arbitrary strong password you'll
remember, then click **Next**.
6. Select an export location using the filename `datascience.cookcountyassessor.com.pfx`,
then click **Next**, then **Finish** to save the file.

## Disaggregate the certificate

NGINX expects separate certificate and key files, so we need to break up the
`.pfx` file we just made using some `openssl` options.

1. Move the exported `.pfx` file to the target/host server (use `scp` or
a similar method). Be sure the directory you move it to is writeable.
2. Run the following command to extract the private key:
    ```
    openssl pkcs12 -in [yourfile.pfx] -nocerts -out temp.key
    ```

    You'll need to type the import password, which is the same password you
    used when exporting the `.pfx` file. You'll be prompted again to create a
    new password, this will be temporary and so can be something short.
3. Run the following command to extract the certificate:
    ```
    openssl pkcs12 -in [yourfile.pfx] -clcerts -nokeys -out datascience.cookcountyassessor.com.crt
    ```
4. Run the following command to decrypt the private key:
    ```
    openssl rsa -in temp.key -out datascience.cookcountyassessor.com.key
    ```
5. Remove the `temp.key` file.

## Install the new certificate

You now have a signed certificate and private key file for use with NGINX.
All that's left to do is to install them in the appropriate directory and set
the correct permissions.

1. Move the `.key`, `.pfx`, and `.crt` files you just created to
`$NGINX_DIRECTORY/secrets`. Where `$NGINX_DIRECTORY` is wherever the CCAO's
[nginx service](https://github.com/ccao-data/service-nginx) is running.
2. Set the owner of the key and certificate files to root:
    ```
    sudo chown root:root $NGINX_DIRECTORY/secrets/datascience.cookcountyassessor.com.pfx
    sudo chown root:root $NGINX_DIRECTORY/secrets/datascience.cookcountyassessor.com.crt
    sudo chown root:root $NGINX_DIRECTORY/secrets/datascience.cookcountyassessor.com.key
    ```
3. Set the permissions of the key and cert files to read-only for user:
    ```
    sudo chmod 600 $NGINX_DIRECTORY/secrets/datascience.cookcountyassessor.com.pfx
    sudo chmod 600 $NGINX_DIRECTORY/secrets/datascience.cookcountyassessor.com.crt
    sudo chmod 600 $NGINX_DIRECTORY/secrets/datascience.cookcountyassessor.com.key
    ```
4. Restart NGINX using `docker compose`. In `$NGINX_DIRECTORY`:
    ```
    docker compose down
    docker compose up -d
    ```
5. Test the certificate by visiting
[RStudio](https://datascience.cookcountyassessor.com). You should be able to
click the certificate in the address bar and view the details you filled out
earlier.

