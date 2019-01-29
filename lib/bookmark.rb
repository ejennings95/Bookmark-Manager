require 'PG'

class Bookmark

  def initialize(link)
    @link = link
  end

  def self.list
    conn = PG.connect( dbname: 'bookmark_manager' )
    conn.exec( "SELECT * FROM bookmarks" ).map do | row |
      row['url']
    end
  end
end
