require 'PG'

class Bookmark

  @@list = []

  def initialize(link)
    @link = link
  end

  def self.list
    conn = PG.connect( dbname: 'bookmark_manager' )
    conn.exec( "SELECT * FROM bookmarks" ) do |result|
      result.each do |row|
        @@list.push(row.values_at('url'))
      end
      @@list
    end
  end
end
