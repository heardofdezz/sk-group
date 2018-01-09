class User < ApplicationRecord
  before_save { self.email = email.downcase }
     validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
     VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
     validates :email, presence: true, length: { maximum: 255 },
                       format: { with: VALID_EMAIL_REGEX },
                       uniqueness: { case_sensitive: false }
  has_secure_password


  def confirm!
    update!(confirmed_at: DateTime.now)
  end

  def confirmed?
    !! confirmed_at
  end
end
