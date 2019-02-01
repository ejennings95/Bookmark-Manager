feature 'You can see a form to delete a bookmark' do
  scenario do
    visit '/update_bookmark'
    find('form').visible?
  end
end

feature 'You can delete a bookmark' do
  scenario do
    visit '/bookmarks'
    fill_in 'title', with: 'Test'
    fill_in 'url', with: 'http://www.test.com'
    click_button 'Add'
    visit '/update_bookmark'
    choose 'Test'
    click_button 'Update'
    fill_in 'title', with: 'Test2'
    fill_in 'url', with: 'http://www.test2.com'
    click_button 'Update'
    expect(page).not_to have_link('Test', href: 'http://www.test.com')
    expect(page).to have_link('Test2', href: 'http://www.test2.com')
  end

  feature 'You cannot update a bookmark if an incorrect url is given' do
    scenario do
      visit '/bookmarks'
      fill_in 'title', with: 'Test'
      fill_in 'url', with: 'http://www.test.com'
      click_button 'Add'
      visit '/update_bookmark'
      choose 'Test'
      click_button 'Update'
      fill_in 'title', with: 'Test2'
      fill_in 'url', with: 'www.test2.com'
      click_button 'Update'
      expect(page).to have_content "Bookmark not saved - url is incorrect"
    end
  end

end
