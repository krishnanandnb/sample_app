# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
	has_secure_password
  validates :name ,presence: true ,length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  before_save { email.downcase! }
  before_save :create_remember_token


 validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
    def current_user=(user)
    @current_user = user
  end
   def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
