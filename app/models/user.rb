class User < ApplicationRecord

  has_secure_password

  validates :password, presence: true
  validates :password, length: { in: 8..20 }
  validates :password_confirmation, presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  private

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
