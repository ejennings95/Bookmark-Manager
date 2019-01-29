# Bookmark Manager Project

## User Stories and domain model diagrams (fun)

```
As a user,
So that I can remember my bookmarks
I want to see a list of my bookmarks
```
```
As a user,
So that I can remember a website
I want to be able to add to my bookmarks
```

![domain model diagram](./images/show_list.jpg)


## A guide to setup the database from scratch:

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager;`
4. Run the query we have saved in the file `01_create_bookmarks_table.sql`
