module ContactMeHelper
	def errors(name)
		if @contact_me.errors[name] && @contact_me.errors[name].length > 0
			return 'errors'
		else
			return ''
		end
	end

	def errors_label(name)
		if errors(name).length > 0
			return "<small>#{@contact_me.errors[name]}</small>"
		else
			return ''
		end
	end
end
