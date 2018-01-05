# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: {message: "Password can\'t be blank"}
  validates :password_digest, presence: true, allow_blank: false
  validates :password, length: { minimum: 8 }, allow_nil: true
  before_validation :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    if user
      if BCrypt::Password.new(user.password_digest).is_password?(password)
        return user
      end
    end

    nil
  end

  def generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end




end
