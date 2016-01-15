class User < ActiveRecord::Base
	validates :email, presence: true
	validates :password, presence: true

	has_many :bookmarks

	def authenticate(password)
		return self if password == password
	end
end