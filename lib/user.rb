require "pry"
class User
	attr_accessor :email
	@@array = []

	def initializer(mail)
		@email = mail 
		@@array<<email 
	end

	def count
    return @@array
  end

end	
 binding.pry
 user = User.new("email@email.com")
 user.count 