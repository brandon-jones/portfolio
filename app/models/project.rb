class Project < ActiveRecord::Base
	before_save :set_tags
  acts_as_disqusable

	def tags_array
  	return self.tags.present? ? self.tags.split(',') : []
  end

  private

  def set_tags
    tags = self.tags.split(',').map { |tag| tag.downcase.strip }
    title = self.title.downcase.gsub('.','')
    tags << title unless tags.include?(title)
    self.tags = tags.join(', ')
  end
end
