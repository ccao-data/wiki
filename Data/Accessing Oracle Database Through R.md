We can connect to IASWorld Oracle database through R using the RJDBC package.  Contact @sweatyhandshake for a connection URL. Download and store a local copy of the Oracle Database JDBC Driver [here](https://www.oracle.com/database/technologies/appdev/jdbc-ucp-21-1-c-downloads.html).

```
# load necessary packages
library(RJDBC)
library(keyring)

# initialize a keyring - you'll need to set a password, choose something you can remember as you'll use it infrequently
keyring_create("iasworld")

# password field for each key on the keyring should be filled with actual credentials/values associated with service field
key_set_with_value(service = "driver_location",
                   password = "",
                   keyring = "iasworld")

key_set_with_value(service = "url",
                   password = "",
                   keyring = "iasworld")

key_set_with_value(service = "user",
                   password = "",
                   keyring = "iasworld")

key_set_with_value(service = "password",
                   password = "",
                   keyring = "iasworld")

# establish connection
jdbcConnection <- dbConnect(drv = JDBC(driverClass = "oracle.jdbc.OracleDriver",
                                       # point to local jdbcDriver, available at
                                       # https://www.oracle.com/database/technologies/appdev/jdbc-ucp-21-1-c-downloads.html
                                       classPath = key_get("driver_location", keyring = "iasworld")),
                            url = key_get("url", keyring = "iasworld"),
                            user = key_get("user", keyring = "iasworld"),
                            password = key_get("password", keyring = "iasworld"))

# test connection
View(dbGetQuery(jdbcConnection, "SELECT * FROM IASWORLD.asmt_hist FETCH FIRST 100 ROWS ONLY"))
```