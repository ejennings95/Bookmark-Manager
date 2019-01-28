feature 'You should see BookmarkManager on the homepage' do
  scenario 'BookmarkManager to be diplayed on the homepage' do
    visit('/')
    expect(page).to have_content 'Bookmark'
  end
end
