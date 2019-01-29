require 'bookmark'

describe Bookmark do
  it 'can be given a bookmark' do
    conn = PG.connect( dbname: 'bookmark_manager_test' )
    conn.exec("INSERT INTO bookmarks VALUES(1, 'www.website.com');")
    expect(Bookmark.list).to include('www.website.com')
  end

  it 'can add a bookmark' do
    expect { Bookmark.add('www.website.com') }.to change { Bookmark.list.count }.by 1
  end
end
