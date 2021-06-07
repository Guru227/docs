# Mongodb shell
--- 29 May 2021 ---
--- version 4.4 ---

## accessing the shell

`mongo -u <username> <database_name>`

You don't need to specify the database if you are the admin user. After executing 
the instruction, you will be prompted for your password.




## User administration

User administration in mongodb involves managing users, their roles (permissions) and the databases they have access to.

1. Show users 

You'll have to first use a database, and then run the following command.
`show users;`

1. create `standard` user

  To create a user, first select the database using `use <database_name>`. Then, you 
  create a user for that database with the following command. Choose the `db` before 
  creating the user. Create user in `admin` table if `admin user`.

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

1. create `database administrator` user

  Choose the `db` before creating the user. Create user in `admin` table if `admin 
  user`.

  ```
  { role : "dbAdmin", db : "dbName"  }, 
  { role : "readWrite", db : "dbName"  }

  ```

  NOTE: "dbAdminAnyDatabase" if priveleges are are included for all db (master db 
  admin)

1. create `user administrator` user

  Choose the `db` before creating the user. Create user in `admin` table if `admin 
  user`.

  ```
  { role: "userAdminAnyDatabase", db: "admin" }
  ```

  NOTE: The `db` admin is used when the administrator has access to all the 
  databases.


1. update user role

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

1. remove user

  to remove specified username from the database `db.removeUser(username)`





 
## Database administration

Database administration in mongodb involves manipulating databases, collections 
(tables) and documents (records).

1. list databases - `show dbs;`
1. select database - `use <database_name>`
1. insert document - `db.<collection>.insert({name: "Ada Lovelace", age: 205})`
1. view collections - `show collections`
1. insert collection - `db.createCollection("mycollection", { capped : true, autoIndexID : true, size : 6142800, max : 10000 } )` | `db.createCollection("mycollection")`
1. drop collection  
  
  Select the database with `use` and verify if the collection is present. Then,
  
  `db.<collection_name>.drop()`

1. delete database

# Sources

1. (Accessing the shell)

1. (Creating a user) https://docs.mongodb.com/manual/tutorial/create-users/

1. (Create an admin user) https://www.shellhacks.com/mongodb-create-user-database-admin-root/

1. (remove user) https://docs.mongodb.com/manual/reference/method/db.removeUser/

1. (Update User Role) https://stackoverflow.com/questions/16527033/how-do-you-change-mongodb-user-permissions | https://www.technicalkeeda.com/mongodb-tutorials/mongodb-update-user

1. (delete collection) https://www.tutorialkart.com/mongodb/mongodb-delete-collection/

1. (insert document) https://www.mongodb.com/basics/create-database

1. (insert collection) https://www.tutorialspoint.com/mongodb/mongodb_create_collection.htm

1. (create database, admin and root users) - https://www.shellhacks.com/mongodb-create-user-database-admin-root/

1. (built-in database user roles - user permission classes) https://studio3t.com/knowledge-base/articles/mongodb-users-roles-explained-part-1/

1. (when does `anyDatabase` role not work) - https://studio3t.com/knowledge-base/articles/mongodb-users-roles-explained-part-1/