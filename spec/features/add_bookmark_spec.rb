feature 'You can see a form to add a bookmark' do
  scenario do
    visit '/bookmarks'
    find('form').visible?
  end
end

feature 'You can add a bookmark' do
  scenario do
    visit '/bookmarks'
    fill_in 'title', with: 'website'
    fill_in 'url', with: 'http://www.website.com'
    click_button 'Add'
    expect(page).to have_content 'website'
  end
end
