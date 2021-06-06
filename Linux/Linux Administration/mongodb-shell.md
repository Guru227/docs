# Mongodb shell
--- 29 May 2021 ---

## accessing the shell

`mongo -u <username> <database_name>`

You don't need to specify the database if you are the admin user. After executing 
the instruction, you will be prompted for your password.

## Create a database user

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

## create an admin user

Only difference is in the roles.

```
db.createUser(
  {
    user: "reportsUser",
    pwd: passwordPrompt(),  // or cleartext password
    roles: [
       { role: "userAdminAnyDatabase", db: "admin" }
    ]
  }
)
```

Set your `username` string. You can replace `password_prompt()` with the string you 
would like to have as your password. Set the roles (privileges) for each table in 
<database_name>.

## show users

You'll have to first use a database, and then run the following command.
`show users;`

## Update user role

Run the `show users` command and then using the username, you can update the user 
role using the following command.

```
db.updateUser( "userName",
               {

                 roles : [
                           { role : "dbAdmin", db : "dbName"  },
                           { role : "readWrite", db : "dbName"  }
                         ]
                }
             )
```



## Basic database operations

1. List databases - `show dbs;`
1. Select database - `use <database_name>`
1. Show users - `show users;`


# Sources

1. (Accessing the shell)

1. (Creating a user) https://docs.mongodb.com/manual/tutorial/create-users/

1. (Create an admin user) https://www.shellhacks.com/mongodb-create-user-database-admin-root/

1. (Update User Role) https://stackoverflow.com/questions/16527033/how-do-you-change-mongodb-user-permissions | https://www.technicalkeeda.com/mongodb-tutorials/mongodb-update-user