require 'PG'

class Bookmark

  def initialize(link)
    @link = link
  end

  def self.list
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )
    else
      conn = PG.connect( dbname: 'bookmark_manager' )
    end
    conn.exec( "SELECT * FROM bookmarks" ).map do | row |
      row['url']
    end
  end

  def self.add(url)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )
    else
      conn = PG.connect( dbname: 'bookmark_manager' )
    end
    conn.exec( "INSERT INTO bookmarks(url) VALUES('#{url}');")
  end
end
