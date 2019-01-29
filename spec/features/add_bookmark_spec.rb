feature 'You can see a form to add a bookmark' do
  scenario do
    visit '/bookmarks'
    find('form').visible?
  end
end

feature 'You can add a bookmark' do
  scenario do
    conn = PG.connect( dbname: 'bookmark_manager_test' )
    visit '/bookmarks'
    fill_in 'add_bookmark', with: 'www.website.com'
    click_button 'Add'
    expect(page).to have_content 'www.website.com'
  end
end
