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
    expect(page).to have_link('website', href: 'http://www.website.com')
  end

  feature 'You cannot add a bookmark if an incorrect url is given' do
    scenario do
      visit '/bookmarks'
      fill_in 'title', with: 'website'
      fill_in 'url', with: 'www.website.com'
      click_button 'Add'
      expect(page).to have_content "Bookmark not saved - url is incorrect"
    end
  end

end
