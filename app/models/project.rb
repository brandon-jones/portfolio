class Project < ActiveRecord::Base
	before_save :set_tags
  acts_as_disqusable

  private

  def set_tags
    tags = self.tags.split(',').map { |tag| tag.downcase.strip }
    self.tags = tags.join(', ')
  end
end
