require 'bookmark'

describe Bookmark do
  it 'can be given a bookmark' do
    bookmark = Bookmark.add(title: 'Website', url: 'http://www.website.com')
    expect(bookmark.url).to eq 'http://www.website.com'
    expect(bookmark.title).to eq 'Website'
  end

  it 'can add a bookmark' do
    expect { Bookmark.add(title: 'Website', url: 'http://www.website.com') }.to change { Bookmark.list.count }.by 1
  end

  it 'can delete a bookmark' do
    bookmark = Bookmark.add(title: 'Website', url: 'http://www.website.com')
    Bookmark.remove(id: Bookmark.list.first.id)
    expect(Bookmark.list.count).to eq 0
  end
end
