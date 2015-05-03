class User < ActiveRecord::Base
  has_secure_password

	validates :name, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }

	def self.authenticate(email, password)
		user = find_by(email: email)
		user && user.authenticate(password)
	end
end
