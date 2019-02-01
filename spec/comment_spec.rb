require 'comment'

describe Comment do

  let(:bookmark) { double(:bookmark, id: 1) }

  it 'Adds a comment to the comments database' do
    bookmark = Bookmark.add(title: 'Website', url: 'http://www.website.com')
    comment = Comment.add(text: 'This is a comment', bookmark_id: Bookmark.list.first.id )
    expect(comment.text).to eq 'This is a comment'
    expect(comment.bookmark_id).to eq Bookmark.list.first.id
  end
end
