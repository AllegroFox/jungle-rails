class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 3 }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      return user
    else
      return nil
    end

  end

end
