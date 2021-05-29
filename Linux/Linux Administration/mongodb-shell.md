# Mongodb shell
--- 29 May 2021 ---

## accessing the shell

`mongo -u <username> <database_name>`

You don't need to specify the database if you are the admin user. After executing 
the instruction, you will be prompted for your password.

## Create a user

To create a user, first select the database using `use <database_name>`. Then, you 
create a user for that database with the following command.

```
db.createUser(
  {
    user: "reportsUser",
    pwd: passwordPrompt(),  // or cleartext password
    roles: [
       { role: "read", db: "reporting" },
       { role: "read", db: "products" },
       { role: "read", db: "sales" },
       { role: "readWrite", db: "accounts" }
    ]
  }
)
```

Set your `username` string. You can replace `password_prompt()` with the string you 
would like to have as your password. Set the roles (privileges) for each table in 
<database_name>.


## Basic database operations

1. List databases - `show dbs;`
1. Select database - `use <database_name>`;


# Sources

1. (Accessing the shell)

1. (Creating a user) https://docs.mongodb.com/manual/tutorial/create-users/