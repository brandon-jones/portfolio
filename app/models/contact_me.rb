class ContactMe
	include ActiveModel::Validations
	# attr_accessor :contact_info, :contact_type, :name, :body, :errors

	def initialize(name, contact_info, body, captcha)
		@errors = {}
		@contact_info = contact_info
		@body = body
		@name = name
		if initialized?
			@captcha = captcha ? nil : 'Please retry the captcha'
		else
			@captcha = nil
		end
	end

	def validate
		
		if @name && @name.empty?
			@errors["name"] = "Name can not be empty"
		end

		if @contact_info && @contact_info.empty?
			@errors["contact_info"] = "Please provide phone, or email"
		end
		if @body && @body.empty?
			@errors["body"] = "What do you want to say?"
		end

		if @captcha
			@errors["captcha"] = @captcha
		end


		return self
	end

	def initialized?
		if @contact_info == nil
			return false
		else 
			return true
		end
	end

end