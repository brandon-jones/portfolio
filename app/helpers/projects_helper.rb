module ProjectsHelper
	def link_text(project)
		return '' unless project
		return project[:link_text] if project[:link_text].present?
		return project[:link] if project[:link].present?
		return ''
	end
end
