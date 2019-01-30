require 'bookmark'

describe Bookmark do
  it 'can be given a bookmark' do
    bookmark =Bookmark.add(title: 'Website', url: 'http://www.website.com')
    expect(bookmark.url).to eq 'http://www.website.com'
    expect(bookmark.title).to eq 'Website'
  end

  it 'can add a bookmark' do
    expect { Bookmark.add(title: 'Website', url: 'http://www.website.com') }.to change { Bookmark.list.count }.by 1
  end
end
