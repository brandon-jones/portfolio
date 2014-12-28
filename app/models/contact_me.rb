class ContactMe
	include ActiveModel::Validations
	attr_accessor :email, :name, :body
end