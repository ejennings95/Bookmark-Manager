feature 'Commenting on Bookmarks' do
  scenario do
    visit '/bookmarks'
    fill_in 'title', with: 'Test'
    fill_in 'url', with: 'http://www.test.com'
    click_button 'Add'
    click_button 'Comment on Test'
    fill_in 'comment', with: 'This is a comment'
    click_button 'Post'
    expect(page).to have_content 'This is a comment'
  end
end
