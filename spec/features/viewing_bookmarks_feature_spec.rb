feature 'You can view bookmarks' do
  scenario do
    Bookmark.add(title: 'Makers', url: 'http://www.makersacademy.com')
    Bookmark.add(title: 'Website', url:'http://www.website.com')
    visit '/bookmarks'
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Website', href: 'http://www.website.com')
  end
end
