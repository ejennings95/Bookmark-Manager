feature 'You can view bookmarks' do
  scenario do
    conn = PG.connect( dbname: 'bookmark_manager_test' )
    conn.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    conn.exec("INSERT INTO bookmarks VALUES(2, 'http://www.website.com');")
    visit '/bookmarks'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.website.com'
  end
end
