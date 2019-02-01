require 'pg'

def test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clean the bookmarks table
  connection.exec("TRUNCATE comments, bookmarks;")
  # connection.exec("TRUNCATE bookmarks;")
end
