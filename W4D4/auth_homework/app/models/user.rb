class User < ApplicationRecord
	attr_reader :password
	validates :username, :session_token, presence: true, uniqueness: true
	validates :password, length: { minimum: 6, allow_nil: true }
	validates :password_digest, presence: { message: 'Password can\'t be blank'}
	after_initialize :ensure_session_token

	def password=(pw)
		@password = pw
		self.password_digest = BCrypt::Password.create(pw)
	end

	def is_password?(pw)
		BCrypt::Password.new(self.password_digest).is_password?(pw)
	end

	def self.find_by_credentials(username, pw)
		user = User.find_by(username: username)
		return nil if user.nil?
		user.is_password?(pw) ? user : nil
	end

	def self.generate_session_token
		SecureRandom::urlsafe_base64(16)
	end

	def reset_session_token
		self.session_token = self.class.generate_session_token
		self.save!
		self.session_token
	end

	private
	def ensure_session_token
		self.session_token ||= self.class.generate_session_token
	end
end
