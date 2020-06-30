class User < ActiveRecord::Base

  has_secure_password 

  validates :email, :first_name, :last_name, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, :password_confirmation, length: { minimum: 4 }

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

end
