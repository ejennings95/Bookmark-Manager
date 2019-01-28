class Bookmark

  @@list = []

  def initialize(link)
    @link = link
    @@list.push(@link)
  end

  def self.list
    @@list
  end

end
