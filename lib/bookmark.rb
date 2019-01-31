require_relative 'database_connection'
require_relative 'database_setup'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.list
      DatabaseConnection.query( "SELECT * FROM bookmarks" ).map do | row |
      Bookmark.new(id: row['id'], title: row['title'], url: row['url'])
    end
  end

  def self.add(title:, url:)
    return false unless is_url?(url)
    result = DatabaseConnection.query( "INSERT INTO bookmarks(title, url) VALUES('#{title}', '#{url}' ) RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'],
    url: result[0]['url'])
  end

  def self.remove(id:)
    DatabaseConnection.query( "DELETE FROM bookmarks WHERE id = '#{id}'" )
  end

  def self.update(id:, title:, url:)
    return false unless is_url?(url)
    result = DatabaseConnection.query( "UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = '#{id}' RETURNING id, url, title;" )
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  private

  def self.is_url?(url)
    url.match(/http/)
  end
end
