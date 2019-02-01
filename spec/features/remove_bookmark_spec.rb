feature 'You can see a form to delete a bookmark' do
  scenario do
    visit '/remove_bookmark'
    find('form').visible?
  end
end

feature 'You can delete a bookmark' do
  scenario do
    visit '/bookmarks'
    fill_in 'title', with: 'Test'
    fill_in 'url', with: 'http://www.test.com'
    click_button 'Add'
    visit '/remove_bookmark'
    choose 'Test'
    click_button 'Delete'
    expect(page).not_to have_content 'Test'
  end
end
