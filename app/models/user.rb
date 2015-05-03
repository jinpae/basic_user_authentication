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

	def send_password_reset_instructions
		generate_token(:password_reset_token)

		UserMailer.password_reset_instructions(self)

		self.password_reset_sent_at = Time.zone.now
		save!
	end

	private
		def generate_token(column)
			begin
				self[column] = SecureRandom.urlsafe_base64
			end while User.exists?(column => self[column])
		end
end
