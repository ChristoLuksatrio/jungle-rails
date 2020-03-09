class User < ActiveRecord::Base
  
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(email)
      user
    else
      nil
    end
  end

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true

end
