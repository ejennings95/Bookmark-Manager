require 'PG'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.list
    test?
    @conn.exec( "SELECT * FROM bookmarks" ).map do | row |
      Bookmark.new(id: row['id'], title: row['title'],
      url: row['url'])
    end
  end

  def self.add(title:, url:)
    return false unless is_url?(url)
    test?
    result  = @conn.exec( "INSERT INTO bookmarks(title, url) VALUES('#{title}', '#{url}' ) RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'],
    url: result[0]['url'])
  end

  private

  def self.is_url?(url)
    url.match(/http/)
  end

  def self.test?
    if ENV['ENVIRONMENT'] == 'test'
      @conn = PG.connect( dbname: 'bookmark_manager_test' )
    else
      @conn = PG.connect( dbname: 'bookmark_manager' )
    end
  end
end
