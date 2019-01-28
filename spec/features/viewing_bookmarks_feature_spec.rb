feature 'You can view bookmarks' do
  scenario do
    Bookmark.new("www.bingo.com")
    Bookmark.new("www.bilbo.com")
    visit '/bookmarks'
    expect(page).to have_content "www.bingo.com"
    expect(page).to have_content "www.bilbo.com"
  end
end
