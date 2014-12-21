class Blog < ActiveRecord::Base

  before_save :set_tags

  private

  def set_tags
    tags = self.tags.split(',').map { |tag| tag.downcase.strip }
    title = self.title.downcase
    tags << self.title unless self.tags.include?(title)
    self.tags = tags.join(', ')
  end
end
