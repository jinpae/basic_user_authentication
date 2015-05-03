class User < ActiveRecord::Base
	before_create { generate_token(:auth_token) }
  has_secure_password

	validates :name, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6, allow_blank: true }

	def self.authenticate(email, password)
		user = find_by(email: email)
		user && user.authenticate(password)
	end

	private
		def generate_token(column)
			begin
				self[column] = SecureRandom.urlsafe_base64
			end while User.exists?(column => self[column])
		end
end
