class User < ApplicationRecord

  has_secure_password

  validates :password, presence: true
  validates :password, length: { in: 8..20 }
  validates :password_confirmation, presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  private

  def authenticate_with_credentials(email, password)
    
  end

end
