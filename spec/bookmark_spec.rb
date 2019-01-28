require 'bookmark'

describe Bookmark do
  it 'can be given a bookmark' do
    expect{ described_class.new('www.website.com') }.to change{ described_class.list.count }.by(1)
  end
  it 'can remember the bookmark it was given' do
    expect(described_class.list).to eq ['www.website.com']
  end
  
  after(:all) do
    described_class.class_variable_set(:@@list, [])
  end
end
